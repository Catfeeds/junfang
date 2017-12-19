####增加结算状态
```sql
ALTER TABLE
    basemst.bbd_loan_order_progress ADD (billing_status varchar(32));
ALTER TABLE
    basemst.bbd_loan_order_progress ADD (billing_finish_time DATETIME);
```

####更新结算状态
```sql
update basemst.bbd_loan_order_progress pro,
(select sa.loan_order_id,count(1) num from basemst.bbd_settle_accounts sa
where sa.settle_type = '退保'
group by sa.loan_order_id) temp1,
(select sa.loan_order_id,count(1) num from basemst.bbd_settle_accounts sa
where sa.settle_type = '退保'
and sa.status = '已核销'
group by sa.loan_order_id) temp2
set pro.billing_status = '已结算'
where pro.loan_order_id = temp1.loan_order_id
and pro.loan_order_id = temp2.loan_order_id
and temp1.num = temp2.num;

update bbd_loan_order_progress set billing_status = '未结算'
where billing_status is null
```
####增加银行账户id
```sql
ALTER TABLE
    `basemst`.`bbd_receivable_order_certificates` ADD (ref_bank_info BIGINT);
ALTER TABLE
    `basemst`.`bbd_receipt_order` ADD (ref_bank_info BIGINT)
```