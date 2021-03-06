<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8"/>
	<title>业务查询 - 老虎机真人体育分红工资</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${cdnDomain}theme/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${cdnDomain}theme/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${cdnDomain}theme/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>

	<link href="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.css" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/custom/plugins/tippy/tippy.css" rel="stylesheet" type="text/css"/>
	<!-- BEGIN THEME STYLES -->
	<link href="${cdnDomain}theme/assets/global/css/components.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/admin/layout/css/themes/default.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
	<link href="${cdnDomain}theme/assets/admin/layout/css/custom.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico"/>
</head>
<body class="page-container-bg-solid">
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper"></div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<h3 class="page-title">老虎机真人体育分红账单</h3>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>当前位置：业务查询<i class="fa fa-angle-right"></i></li><li>老虎机真人体育分红账单</li>
				</ul>
			</div>
			<!-- BEGIN PAGE CONTENT-->
			<div id="table-dividend-bill-list" class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div class="portlet light" style="margin-bottom: 10px;">
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="form-inline">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group ">
												<div class="input-group input-medium">
													<span class="input-group-addon no-bg fixed">用户名</span>
													<input name="username" class="form-control" type="text">
												</div>
											</div>
											<div class="form-group">
												<div class="input-group input-medium">
													<span class="input-group-addon no-bg fixed">状态</span>
													<select name="status" class="form-control" data-size="6">
														<option value="">全部</option>
														<option value="1">已发放</option>
														<option value="2">待审核</option>
														<option value="3">待领取</option>
														<option value="4">已拒绝</option>
														<option value="5">未达标</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div data-field="time" class="input-group input-large date-picker input-daterange">
													<span class="input-group-addon no-bg fixed">日期筛选</span>
													<input type="text" class="form-control" name="sTime"/>
													<span class="input-group-addon">至</span>
													<input type="text" class="form-control" name="eTime"/>
												</div>
											</div>
											<div class="form-group">
												<a data-command="search" href="javascript:;" class="btn green-meadow"><i class="fa fa-search"></i> 搜索信息</a>
												<label><input name="advanced" type="checkbox"> 高级搜索</label>
											</div>
										</div>
									</div>
									<div class="row" data-hide="advanced" style="padding-top: 3px;">
										<div class="col-md-12">
											<div class="form-group">
												<div class="input-group input-range input-medium">
													<span class="input-group-addon no-bg">金额筛选</span>
													<input class="form-control from" name="minUserAmount" type="text">
													<span class="input-group-addon symbol">~</span>
													<input class="form-control to" name="maxUserAmount" type="text">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="table-toolbar" style="margin:0px;">
								<p class="input-group-addon no-bg fixed">总金额：</p>
								<p class="input-group-addon no-bg fixed" id="totalUserAmount">0</p>
							</div>
							<div class="table-scrollable table-scrollable-borderless">
								<table class="table table-hover table-light">
									<thead>
									<tr class="align-center">
										<th width="6%">ID</th>
										<th width="10%">用户名</th>
										<th width="6%">分红比例</th>
										<th width="10%">消费</th>
										<th width="10%">亏损</th>
										<th width="10%">金额</th>
										<th width="15%">周期</th>
										<th width="10%">生成时间</th>
										<th width="6%">状态</th>
										<th width="15%">操作</th>
									</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<div class="page-list"></div>
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>
			<div id="modal-approve-dividend" class="modal fade bs-modal-lg" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h4 class="modal-title">审核老虎机真人体育分红</h4>
						</div>
						<div class="modal-body" style="padding: 0 20px 0 20px;">
							<form class="form-horizontal">
								<div class="form-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">用户名:</label>
												<div class="col-md-8">
													<p data-field="username" class="form-control-static"></p>
													<input name="id" type="hidden">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">分红比例(%):</label>
												<div class="col-md-8">
													<p data-field="scale" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">消费:</label>
												<div class="col-md-8">
													<p data-field="billingOrder" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">本次亏损:</label>
												<div class="col-md-8">
													<p data-field="thisLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">上半月亏损:</label>
												<div class="col-md-8">
													<p data-field="lastLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">本次共亏损:</label>
												<div class="col-md-8">
													<p data-field="totalLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">周期:</label>
												<div class="col-md-8">
													<p data-field="period" class="form-control-static"></p>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">状态:</label>
												<div class="col-md-8">
													<p data-field="status" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="control-label col-md-2">分红金额:</label>
												<div class="col-md-10">
													<input name="userAmount" class="form-control input-inline input-medium" type="text" autocomplete="off">
													<abbr class="tippy" title='计算公式：分红比例 × 本次共亏损(需小于0)'>?</abbr>
													<span class="help-inline">请输入金额。</span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="control-label col-md-2">备注:</label>
												<div class="col-md-10">
													<input name="remarks" class="form-control input-inline input-medium" type="text" autocomplete="off">
													<span class="help-inline">操作说明。</span>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="control-label col-md-2">资金密码:</label>
												<div class="col-md-10">
													<input name="withdrawPwd" class="form-control input-inline input-medium" type="password" autocomplete="off">
													<span class="help-inline">请输入资金密码。</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" data-command="agree" class="btn green-meadow"><i class="fa fa-check"></i> 确认发放</button>
							<button type="button" data-command="deny" class="btn red-sunglo"><i class="fa fa-remove"></i> 拒绝发放</button>
							<button type="button" data-command="del" class="btn btn-danger"><i class="fa fa-remove"></i> 删除</button>
							<button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 取消</button>
						</div>
					</div>
				</div>
			</div>
			<div id="modal-details-dividend" class="modal fade bs-modal-lg" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-body" style="padding: 0 20px 0 20px;">
							<form class="form-horizontal">
								<div class="form-body">
									<h3 class="form-section">老虎机真人体育分红详情</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">用户名:</label>
												<div class="col-md-8">
													<p data-field="username" class="form-control-static"></p>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">分红比例(%):</label>
												<div class="col-md-8">
													<p data-field="scale" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">消费:</label>
												<div class="col-md-8">
													<p data-field="billingOrder" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">本次亏损:</label>
												<div class="col-md-8">
													<p data-field="thisLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">上半月亏损:</label>
												<div class="col-md-8">
													<p data-field="lastLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">本次共亏损:</label>
												<div class="col-md-8">
													<p data-field="totalLoss" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">周期:</label>
												<div class="col-md-8">
													<p data-field="period" class="form-control-static"></p>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">状态:</label>
												<div class="col-md-8">
													<p data-field="status" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="control-label col-md-4">分红金额:</label>
												<div class="col-md-8">
													<p data-field="userAmount" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="control-label col-md-2">备注:</label>
												<div class="col-md-10">
													<p data-field="remarks" class="form-control-static"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" data-dismiss="modal" class="btn btn-danger"><i class="fa fa-undo"></i> 返回列表</button>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${cdnDomain}theme/assets/global/plugins/respond.min.js"></script>
<script src="${cdnDomain}theme/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${cdnDomain}theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${cdnDomain}theme/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/custom/plugins/tippy/tippy.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${cdnDomain}theme/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/scripts/md5.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/scripts/global.js?v=${cdnVersion}" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/custom/scripts/user-game-dividend-bill.js?v=${cdnVersion}" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		// init data
		GameDividendBill.init();
	});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>