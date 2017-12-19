--先把所有有groupid的下游订单取出来
select * from `T_MyOrder` o
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`;
--根据所有下游订单创建group
insert into t_order_group(amount,product_type,first_order_id,last_order_id,createby)
select o.`count`,o.`productType`,supplierOrder.`MyOrder_id`,o.`MyOrder_id`,'SYSTEM' from `T_MyOrder` o,`T_MyOrder` supplierOrder
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`
and supplierOrder.`orderGroupId` = o.`orderGroupId` 
and supplierOrder.`demand_mem_id` = o.`order_group_transfer_mem_id`;

insert into t_order_group(id,amount,product_type,first_order_id,last_order_id,createby)
select  case substring(o.myorder_id,1,1) when 'Q' then concat('G',substring(o.myorder_id,2,8),'1',substring(o.myorder_id,11)) else concat('G',substring(o.myorder_id,2,8),'2',substring(o.myorder_id,11)) end orderGroupId,
o.`count`,o.`productType`,supplierOrder.`MyOrder_id`,o.`MyOrder_id`,'SYSTEM' from `T_MyOrder` o
left join `T_MyOrder` supplierOrder on supplierOrder.`orderGroupId` = o.`orderGroupId` and supplierOrder.`demand_mem_id` = o.`order_group_transfer_mem_id` and supplierOrder.myorder_id not like '%-1'
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`
and o.myorder_id not like '%-1'
--把所有订单添加到mapping 表中
insert into t_order_group_mapping(`orders_MyOrder_id`,`orderGroups_id`)
select o.`MyOrder_id`,g.id from `T_MyOrder` o,`t_order_group` g
where o.`orderGroupId` is not null and o.`orderGroupId` <>'' 
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`
and o.`MyOrder_id` = g.`last_order_id`
union all
select o.`MyOrder_id`,g.id from `T_MyOrder` o,`t_order_group` g
where o.`orderGroupId` is not null and o.`orderGroupId` <>'' 
and o.`demand_mem_id` = o.`order_group_transfer_mem_id`
and o.`MyOrder_id` = g.`first_order_id`;
--更新下游订单supplier_order_id
update T_MyOrder,(select * from `T_MyOrder` o
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`
 and o.myorder_id not like '%-1')a,
(select * from `T_MyOrder` o
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`demand_mem_id` = o.`order_group_transfer_mem_id`
and o.myorder_id not like '%-1')b
 set T_MyOrder.supplier_order_id = b.`MyOrder_id`
where a.`orderGroupId` = b.`orderGroupId`
and T_MyOrder.`MyOrder_id` = a.`MyOrder_id`;
--更新上游订单left_grouped_amt
update `T_MyOrder`,
(select o.`orderGroupId`,sum(o.`count`) totalCount from `T_MyOrder` o
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`provider_mem_id` = o.`order_group_transfer_mem_id`
 and o.myorder_id not like '%-1'
group by o.`orderGroupId`) temp
set T_MyOrder.`left_grouped_amt` = T_MyOrder.`count` - temp.totalCount
where T_MyOrder.`orderGroupId` is not null and T_MyOrder.`orderGroupId` <>''
and T_MyOrder.`demand_mem_id` = T_MyOrder.`order_group_transfer_mem_id`
and T_MyOrder.`orderGroupId` = temp.orderGroupId
and T_MyOrder.myorder_id not like '%-1';
--上游left_grouped_amt不为0的订单,新建一个只包含上游订单的group
insert into t_order_group(id,amount,product_type,first_order_id,last_order_id,createby)
select  concat('G',substring(o.myorder_id,2,8),'3',substring(o.myorder_id,11)),o.`count`,o.`productType`,o.`MyOrder_id`,o.`MyOrder_id`,'SYSTEM' 
from `T_MyOrder` o
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.`demand_mem_id` = o.`order_group_transfer_mem_id`
and o.`left_grouped_amt` >0;
--把该上游订单添加到mapping
insert into t_order_group_mapping(`orders_MyOrder_id`,`orderGroups_id`)
select g.`first_order_id`,g.id from `t_order_group` g
where not EXISTS (select * from t_order_group_mapping mapping where mapping.`orderGroups_id` = g.id)
--更新所有grouped_order为true
update T_MyOrder o set o.`grouped_order` = true
where o.`orderGroupId` is not null and o.`orderGroupId` <>''
and o.myorder_id not like '%-1'
--更新所有下游关联订单的leftGroupedAmt = count
update `T_MyOrder` set left_grouped_amt = count
where `orderGroupId` is not null and `orderGroupId` <>''
and `provider_mem_id` = `order_group_transfer_mem_id`
and myorder_id not in('Q2017030700016','Q2017030700029','Q2017030800017')










































