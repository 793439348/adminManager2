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
<title>幸运大转盘</title>
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
<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
<link href="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>

<link href="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.css" rel="stylesheet" type="text/css"/>
<!-- BEGIN THEME STYLES -->
<link href="${cdnDomain}theme/assets/global/css/components.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
<link href="${cdnDomain}theme/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${cdnDomain}theme/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link href="${cdnDomain}theme/assets/admin/layout/css/themes/default.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
<link href="${cdnDomain}theme/assets/admin/layout/css/custom.css?v=${cdnVersion}" rel="stylesheet" type="text/css"/>
<style type="text/css">
.rlist {
	overflow: hidden;
}
.rlist > ul {
	padding: 0;
}

.rlist > ul > li {
	list-style-type: none;
	display: inline-block;
	text-align: center;
	background-color: #0EB48D;
	color: #fff;
	line-height: 1.5;
	border-radius: 6px !important;;
	width: 160px;
	padding: 15px 0;
	margin: 0 3px;
}

.rlist > ul > li > span {
	color: #FFF65A;
}

.rlist > ul > li:nth-child(1) {
	background: #0eb48d;
}

.rlist > ul > li:nth-child(2) {
	background: #f87821;
}

.rlist > ul > li:nth-child(3) {
	background: #fa536b;
}

.rlist > ul > li:nth-child(4) {
	background: #cb50dc;
}

.rlist > ul > li:nth-child(5) {
	background: #da259d;
}

.rlist > ul > li:nth-child(6) {
	background: #8b316c;
}
</style>
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
			<h3 class="page-title">幸运大转盘</h3>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>当前位置：活动维护<i class="fa fa-angle-right"></i></li><li>幸运大转盘</li>
				</ul>
			</div>
			<!-- END PAGE HEADER-->
			<div id="activity-rebate-wheel-config-edit" class="modal fade" data-backdrop="static" tabindex="-1">
				<div class="modal-dialog" style="width: 720px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"></button>
							<h4 class="modal-title">编辑活动</h4>
						</div>
						<div class="modal-body" style="padding: 5px 20px 0px 20px;">
							<form class="form-horizontal">
								<div class="form-body">
									<div class="form-group">
										<div class="col-md-12" style="margin-bottom: 10px;">
											<label class="control-label" style="text-align: left;"><strong>规则配置</strong></label>
											<a data-command="addRule" href="javascript:;" class="btn default btn-xs green"><i class="fa fa-plus"></i> 添加规则</a>
										</div>
										<div class="col-md-12" style="height: 450px;overflow-y: auto;" data-type="rules">
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认</button>
							<button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 取消</button>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div id="activity-rebate-wheel-config" class="portlet light">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift font-green-sharp"></i>
								<span class="caption-subject font-green-sharp bold uppercase">活动配置</span>
							</div>
							<div class="actions">
								<div class="btn-group">
									<a data-command="edit" href="javascript:;" class="btn blue"><i class="fa fa-edit"></i> 编辑</a>
								</div>
								<div class="btn-group">
									<a data-command="status" href="javascript:;" class="btn green"><i class="fa fa-ban"></i> 暂停</a>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="rlist">
								<ul></ul>
							</div>
						</div>
					</div>
					<!-- END PORTLET-->
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PORTLET-->
					<div id="activity-rebate-wheel-bill" class="portlet light">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift font-green-sharp"></i>
								<span class="caption-subject font-green-sharp bold uppercase">领取记录</span>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<form action="javascript:;" class="form-inline">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="input-group input-medium">
													<span class="input-group-addon no-bg fixed">用户名</span>
													<input name="username" class="form-control" type="text">
												</div>
											</div>

											<div class="form-group">
												<div data-field="time" class="input-group input-large date-picker input-daterange">
													<span class="input-group-addon no-bg">领取日期</span>
													<input class="form-control" name="from" type="text">
													<span class="input-group-addon">至</span>
													<input class="form-control" name="to" type="text">
												</div>
											</div>

											<div class="form-group">
												<div class="input-group input-medium">
													<span class="input-group-addon no-bg fixed">IP</span>
													<input name="ip" class="form-control" type="text">
												</div>
											</div>
											
											<div class="form-group">
												<a data-command="search" href="javascript:;" class="btn green-meadow"><i class="fa fa-search"></i> 搜索记录</a>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="table-toolbar" style="margin:0px;">
								<p class="input-group-addon no-bg fixed">总金额：</p>
								<p class="input-group-addon no-bg fixed" id="totalAmount">0</p>
							</div>
							<div class="table-scrollable table-scrollable-borderless">
								<table class="table table-hover table-light">
									<thead>
										<tr class="align-center">
											<th width="15%">ID</th>
											<th width="15%">用户名</th>
											<th width="15%">消费金额</th>
											<th width="15%">领取金额</th>
											<th width="20%">领取时间</th>
											<th width="20%">IP</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
							<div class="page-list"></div>
						</div>
					</div>
					<!-- END PORTLET-->
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
<script src="${cdnDomain}theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/plugins/jquery.json.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${cdnDomain}theme/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/scripts/md5.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/scripts/global.js?v=${cdnVersion}" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/custom/scripts/activity-rebate-wheel.js?v=${cdnVersion}" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
jQuery(document).ready(function() {
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	// init data
	ActivityRebateWheel.init();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>