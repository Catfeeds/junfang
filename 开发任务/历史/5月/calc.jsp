<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>邦帮贷计算器</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="img/favicon.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?dbc922f804acb4a778fc735ad2046888";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<link rel="stylesheet" href="http://g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<style>
.card-content-inner {
	padding-top: 0.3rem;
	padding-bottom: 0.3rem;
}
.item-input {
	text-align : right;	
}
.list-block {
	font-size:0.75rem;
}
.list-block input[type=text], .list-block input[type=tel], .list-block input[type=number]{
	text-align : right;	
	font-size: .75rem;
}
.button {
    border: 1px solid #ff7600;
    color: #ff7600;
}
.button:active {
 	border: 1px solid #ff7600;
    color: #ff7600;
}
.button.button-fill {
	background: #ff7600;
}
.button.button-fill:active {
	color:#FFF;
	background: #ff7600;
}

.buttons-row .tab-link {
    color: #3d4145; 
    padding: 0 0.5rem ;
    margin: 0 1rem;
    border-radius: 0;
}

.buttons-row .tab-link.active {
    color: #ff7600;
    border-bottom-color: #ff7600;
    border-bottom-width: 2px;
    border-bottom-style: solid;
}

.card-header:after{
    height: 0px;
	border-bottom-color: #e1e1e1;
    border-bottom-width: 2px;
    border-bottom-style: dashed;
    background-color:inherit;
}
.card-footer{
	margin-top:1rem;
	text-align:center;
	padding-bottom:0.5rem;
	
}
.card-footer:before{height:0px;}
.card-footer ul{
	width:100%;
}
.list-block .card-footer  ul:before{
	height:0px;
}
.list-block .card-footer  ul:after{
	height:0px;
}
.interestRules .label{
	color:blue;
}
</style>
</head>
<body>
	<div class="page-group">
		<div class="page page-current" id="page-calc">
			<!-- <header class="bar bar-nav">
				<a class="button button-link button-nav pull-left back" href="${ctx }/home/index">
			      <span class="icon icon-left"></span>
			      返回
			    </a>
				<h1 class="title">邦帮贷计算器</h1>
			</header> -->
			<div class="content native-scroll" style="position:absolute;top:0px;left:0px;">
				<div class="card" style="margin-top:0;margin-left:0;margin-right:0;box-shadow:none;padding-bottom:3%;">
					<img src="/statics/img/邦帮贷宣传.png" style="width:100%;border:none;">
					<a href="#" class="button button-big button-fill button-apply" style="width:96%;margin:0 auto;margin-top:3%;">马上申请</a>
				</div>
				<div class="card" style="margin-left:0;margin-right:0;box-shadow:none;">
					<div class="card-content">
						<div class="card-content-inner list-block" style="padding-left:4px;">
							<ul>
								<li>
									<div class="item-content">
										<div class="item-inner">
											<div class="item-title label">贷款类型</div>
											<div class="item-input label">保证金贷款</div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner orderAmount">
											<div class="item-title label">合同金额</div>
											<div class="item-input">
												<input type="number" placeholder="合同总金额" />
											</div>
											<div class="item-after">
												<span>万元</span>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner deposit">
											<div class="item-title label">保证金</div>
											<div class="item-input label"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner loanAmount">
											<div class="item-title label">贷款金额</div>
											<div class="item-input label"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner loanDays">
											<div class="item-title label">贷款天数</div>
											<div class="item-input">
												<input type="number"/>
											</div>
											<div class="item-after">
												<span>天</span>
											</div>
										</div>
									</div>	
								</li>
								<li>
									<a href="#page-view-interest-rules" class="item-link item-content">
										<div class="item-inner interestRules">
											<div class="item-input label">查看利息规则</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card"  style="margin-left:0;margin-right:0;box-shadow:none;">
					<div class="card-header">
						<div class="content-block">
							<div class="buttons-row">
								<a href="#" class=" tab-link active type-onetime">一次性还款</a> 
								<a href="#" class=" tab-link type-instalment">分期还款</a>
							</div>
						</div>
					</div>
					<div class="card-content" id="addRepayForm" style="display: none">
						<div class="card-content-inner list-block" style="padding-left:4px;">
							<ul>
								<li>
									<div class="item-content">
										<div class="item-inner repay-days">
											<div class="item-title label">还款日期</div>
											<div class="item-input">
												<input type="tel" placeholder="合同签订第几天">
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="item-content">
										<div class="item-inner repay-amount">
											<div class="item-title label">还款金额</div>
											<div class="item-input">
												<input type="number" placeholder="本次还款金额">
											</div>
											<div class="item-after">
												<span>万元</span>
											</div>
										</div>
									</div>
								</li>
							</ul>
							<a href="#" class="button addRepay">添加还款</a>
						</div>
					</div>
					<div class="card-content interest">
						<div class="card-content-inner list-block" style="padding-left:4px;">
							<ul>
								<li class="item-content">
									<div class="item-inner">
										<div class="row" style="display: block; width: 100%; text-align: center;">
											<div class="col-25">
												<span>计息期间</span>
											</div>
											<div class="col-25">
												<span>计息金额</span>
											</div>
											<div class="col-25">
												<span>月利率</span>
											</div>
											<div class="col-25">
												<span>利息</span>
											</div>
										</div>
									</div>
								</li>
								<div class="instalment"></div>
								<li class="item-content item-footer">
									<div class="item-inner">
										<div class="row" style="display: block; width: 100%; text-align: right;">
											<span style="font-size: .7rem;">总利息: &nbsp;<span class="totalInterest" style="color: #ff7600; "></span>元</span>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card"  style="margin:0px;box-shadow:none;background:none;">
					<div class="card-footer" style="padding:0px;">
						<ul style="padding:0px;">
							<li style="list-style:none;">咨询热线:<a href="tel:18969911394">18969911394</a></li>
							<li style="list-style:none;">&copy 君方科技</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="page" id="page-view-interest-rules">
			<header class="bar bar-nav">
				<a class="button button-link button-nav pull-left back" href="#page-calc"> <span class="icon icon-left"></span>
					返回
				</a>
				<h1 class="title">阶梯利息</h1>
			</header>
			<div class="content native-scroll">
				<div class="card">
					<div class="card-content">
						<div class="card-content-inner list-block">
							<ul>
								<li class="item-content" data-index='0'>
									<div class="item-inner">
										<div class="item-title">1-7天</div>
										<div class="item-after">全额计息,月利率0.8%</div>
									</div>
								</li>
								<li class="item-content" data-index='1'>
									<div class="item-inner">
										<div class="item-title">8-15天</div>
										<div class="item-after">月利率0.8%,按剩余金额计算</div>
									</div>
								</li>
								<li class="item-content" data-index='2'>
									<div class="item-inner">
										<div class="item-title">16-30天</div>
										<div class="item-after">月利率1%,按剩余金额计算</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/template" id="interest-template">
		<li class="item-content">
			<div class="item-inner">
				<div class="row" style="display: block; width: 100%; text-align: center;">
					<div class="col-25"><span style="font-size: .6rem;">第{0}天</span></div>
					<div class="col-25"><span style="font-size: .6rem;">{1}万</span></div>
					<div class="col-25"><span style="font-size: .6rem;">{2}</span></div>
					<div class="col-25" style=" text-align: right;"><span style="font-size: .6rem; color: #ff7600;">{3}</span><span style="font-size: .6rem;">元</span></div>
				</div>
			</div>
		</li>
	</script>
	<script type='text/javascript' src='http://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='http://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script>
		if (!String.format) {
			String.format = function(format) {
				var args = Array.prototype.slice.call(arguments, 1);
				return format.replace(/{(\d+)}/g, function(match, number) {
					return typeof args[number] != 'undefined' ? args[number]
							: match;
				});
			};
		}
	    
		var order = new Object();
		order.MARGIN = 0.2;
		order.amount = 0;
		order.loanAmount = 0;
		order.loanDays = 0;
		order.interestRate = 0.008;
		order.instalment = false;

		order.resetAmount = function(amount) {
			if (amount <= 0 || amount == order.amount) {
				return;
			}
			
			order.amount = amount;
			this.calcDeposit();
			this.calcLoanAmount();
		}
		
		order.resetLoanDays = function(days){
			if(days<=0 || days == order.loanDays){
				return;
			}else if(days>30){
				$.alert('还款日期不能超出30天', '添加失败', function() {
					$('.loanDays input').val('');
				});
				return;
			}
			
			order.loanDays = days;
			order.repays = new Array(order.loanDays);
			this.calcInterest();
		}
		
		order.calcDeposit = function() {

			order.deposit = order.amount * order.MARGIN;
			$(".deposit .item-input").html(order.deposit.toFixed(2));
			if ($(".deposit .item-after").length == 0) {
				$(".deposit").append(
						'<div class="item-after"><span>万元</span></div>');
			}
		}

		order.calcLoanAmount = function() {
			if (order.amount <= 0) {
				return;
			}

			var loanAmount = order.amount - order.deposit;
			if(order.loanAmount == loanAmount){
				return;
			}
			order.loanAmount = loanAmount;
			$(".loanAmount .item-input").html(order.loanAmount.toFixed(2));
			if ($(".loanAmount .item-after").length == 0) {
				$(".loanAmount").append(
						'<div class="item-after"><span>万元</span></div>');
			}
			this.repays = new Array(order.loanDays);
			this.calcInterest();
		}

		order.getFirst7DayInterest = function(){
			var record = new Object();
			record.startDay = 1;
			record.endDay = 7;
			record.amount = this.loanAmount;
			record.interestRate = 0.008;
			record.interest = this.loanAmount * 10000 * record.interestRate / 30 * 7;
			
			return record;
		}
		
		order.addInterestInView = function(record) {
			var template = $('#interest-template').html();
			var dayRange =  record.startDay + "-" + record.endDay;
			if(record.endDay == record.startDay){
				dayRange = record.startDay;
			}
			var html = String.format(template, dayRange, record.amount.toFixed(2), record.interestRate.toFixed(3) , record.interest.toFixed(2));
			$('.instalment').append(html);
		}
		
		order.calcInterest = function() {
			if (order.loanAmount <= 0) {
				return;
			}
			
			if(!this.instalment){
				var template = $('#interest-template').html();
				$('.instalment').empty();
				if(this.loanDays<=7){
					this.totalInterest = this.loanAmount * 10000 * 0.008 * 7 / 30;
					var html = String.format(template, "1-7", this.loanAmount.toFixed(2),0.008, this.totalInterest.toFixed(2));
					$('.instalment').append(html);
				}else if(this.loanDays<=15){
					this.totalInterest = this.loanAmount * 10000 * 0.008 * this.loanDays / 30;
					var html = String.format(template, 1 + "-" + (this.loanDays - 1), this.loanAmount.toFixed(2),0.008, this.totalInterest.toFixed(2));
					$('.instalment').append(html);
				}else{
					var interestBefore15Day = this.loanAmount * 10000 * 0.008 / 30 * 15;
					$('.instalment').append(String.format(template, "1-15", this.loanAmount.toFixed(2),0.008, interestBefore15Day.toFixed(2)));
					var interestAfter15Day = this.loanAmount * 10000 * 0.01 / 30 * (this.loanDays -16);
					$('.instalment').append(String.format(template, 16 + "-" + (this.loanDays - 1), this.loanAmount.toFixed(2),0.01, interestAfter15Day.toFixed(2)));
					
					this.totalInterest = interestBefore15Day + interestAfter15Day;
				}
			} else{
				$('.instalment').empty();
				
				var records = new Array();
				var j = 0;
				var first7DayInterest = order.getFirst7DayInterest();
				records[j++] = first7DayInterest;
				
				var leftAmount = order.loanAmount;
				var lastRepayDay = 7;
				for (i = 0; i < this.repays.length; i++) {       
					
					if(leftAmount <= 0){
						break;
					}
					
					if(this.repays[i] != null || i == 15){
						var repaidAmount = 0;
                        if(this.repays[i]){
                            repaidAmount = this.repays[i].amount;
                        }
						
						if(i<7 ) {
							leftAmount = leftAmount - repaidAmount;
						} else {
							var record = new Object();
							record.startDay = lastRepayDay + 1;
							record.endDay = i;
							record.amount = leftAmount;
							if(i <= 15) {
								record.interestRate = 0.008;
							} else {
								record.interestRate = 0.01;
							}
							record.interest = leftAmount * 10000 * record.interestRate / 30 * (record.endDay - record.startDay + 1);
							leftAmount = leftAmount - repaidAmount;
							lastRepayDay = record.endDay;
							records[j++] = record;
						}

					}
				}
				
				if(leftAmount > 0 && order.loanDays > 7 && order.loanDays != 15){
					var lastRepay = new Object();
					if(order.loanDays>7 && order.loanDays<15){
						lastRepay.interestRate = 0.008;
					}else{
						lastRepay.interestRate = 0.01;
					}
					lastRepay.startDay = lastRepayDay + 1;
					lastRepay.endDay = order.loanDays - 1;
					lastRepay.amount =  leftAmount;
					lastRepay.interest = leftAmount * 10000 * lastRepay.interestRate / 30 * (lastRepay.endDay - lastRepay.startDay + 1);
					records[j++] = lastRepay;
					this.repays[this.repays.length - 1] = lastRepay;	
				}
				
				this.totalInterest = 0;

				for (x in records){
					var record = records[x];
					this.totalInterest += record.interest;
					order.addInterestInView(record);
				}
				
			}
			
			$('.totalInterest').html(this.totalInterest.toFixed(2));
		}

		order.addRepay = function(repay) {
			this.repays[repay.days - 1] = repay;
			var amt = 0;
			for (i = 0; i < this.repays.length - 1; i++) {
				if(this.repays[i] != null){
					amt = amt + this.repays[i].amount;
				}
			}
			
			if(amt < this.loanAmount) {
				var lastRepay = new Object();
				lastRepay.days = this.repays.length;
				lastRepay.amount =  this.loanAmount - amt;
				this.repays[this.repays.length - 1] = lastRepay;
			} else {
				this.repays[this.repays.length - 1] = null;
			}
		}
		
		$().ready(function() {
			 
			$(".orderAmount input").on('blur', function() {
				order.resetAmount(Number($(this).val()));
			});
			
			$(".loanDays input").on('blur', function() {
				order.resetLoanDays(Number($(this).val()));
			});

			$('.type-onetime').on('click', function() {
				$(this).addClass('active');
				order.instalment = false;
				order.calcInterest();

				$('.type-instalment').removeClass('active');
				$('#addRepayForm').hide();
			})

			$('.type-instalment').on('click', function() {
				$(this).addClass('active');
				order.instalment = true;
				order.calcInterest();

				$('.type-onetime').removeClass('active');
				$('#addRepayForm').show();
			})

			$('.addRepay').on('click', function() {
				var repay = new Object();
				repay.days = $('.repay-days input').val();
				repay.amount = $('.repay-amount input').val();

				if (repay.days.length <= 0) {
					$.alert('还款日期不能为空', '添加失败', function() {
						$('.repay-days input').focus();
					});
					return;
				} else {
					repay.days = Number(repay.days);
					if (repay.days > 30) {
						$.alert('还款日期不能超出30天', '添加失败', function() {
							$('.repay-days input').val('');
							$('.repay-days input').focus();
						});
						return;
					} else if(repay.days > order.loanDays){
						$.alert('还款日期不能超出贷款天数', '添加失败', function() {
							$('.repay-days input').val('');
							$('.repay-days input').focus();
						});
						return;
						
					}
				}
				if (repay.amount.length <= 0) {
					$.alert('还款金额不能为空', '添加失败', function() {
						$('.repay-amount input').focus();
					});
					return;
				} else {
					repay.amount = Number(repay.amount);
					
					var leftAmt = order.loanAmount;
					for (i = 0; i < order.repays.length - 1; i++) {
						if(order.repays[i] != null){
							leftAmt = leftAmt - order.repays[i].amount;
						}
					}
					if (repay.amount > leftAmt) {
						$.alert('还款金额不能超出贷款总额', '添加失败', function() {
							$('.repay-amount input').val('');
							$('.repay-amount input').focus();
						});
						return;
					}
				}
				
				$('.repay-days input').val('');
				$('.repay-amount input').val('');
				order.addRepay(repay);
				order.calcInterest();
			});
			

		$('.button-apply').on('click', function() {
				$.modal({
					title : '邦帮贷申请',
					text : '请输入您的手机号码，以便于我们的工作人员联系您',
					afterText : '<input type="tel" class="modal-text-input contact-number">',
					buttons : [ {
						text : '取消',
					}, {
						text : '确定',
						bold : true,
						onClick : function() {
							order.tel = $('.contact-number').val();
							console.log(order);
							$.ajax({
								url: "http://120.26.133.80:8585/jfservice/loan/add",
								type:"POST",
								data: JSON.stringify(order),
								dataType: 'application/json',
								success: function() {
									$.alert('邦帮贷申请成功，请保持电话畅通，我们的工作人员会在一个工作日之内和您取得联系！', '申请成功');
								},
								error: function(e) {
									console.log(e);
									$.alert('邦帮贷申请成功，请保持电话畅通，我们的工作人员会在一个工作日之内和您取得联系！', '申请成功');
								}
							});
							 
							
						}
					} ]
				});
			});
		});
	</script>
</body>
</html>