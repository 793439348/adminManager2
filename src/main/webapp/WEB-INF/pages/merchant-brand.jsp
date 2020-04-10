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
    <title>品牌管理</title>
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

    <link href="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.css" rel="stylesheet" type="text/css"/>
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

    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN PAGE HEADER-->
            <h3 class="page-title">品牌管理</h3>
            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>当前位置：品牌管理<i class="fa fa-angle-right"></i></li><li>品牌信息</li>
                </ul>
            </div>

            <!-- BEGIN PAGE CONTENT-->
            <div id="table-list" class="row">
                <div class="col-md-12">
                    <!-- END PAGE HEADER-->
                    <div id="modal-edit" class="modal fade" data-backdrop="static" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"></button>
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                                    <form class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">商户名</label>
                                                <div class="col-md-9">
                                                    <select name="merchantCode" class="form-control input-medium">
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">品牌名称</label>
                                                <div class="col-md-9">
                                                    <input name="name" class="form-control input-inline input-medium" type="text" >
                                                    <span class="help-inline"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">品牌代号</label>
                                                <div class="col-md-9">
                                                    <input name="code" class="form-control input-inline input-medium" type="text">
                                                    <span class="help-inline"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">状态</label>
                                                <div class="col-md-9">
                                                    <div class="radio-list">
                                                        <input type="radio" name="status" value="0">启用
                                                        <input type="radio" name="status" value="1">禁用
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">移动端模板</label>
                                                <div class="col-md-9">
                                                    <select name="template" class="form-control input-medium" onchange="showTempIMG(this)">

                                                    </select>
                                                    <img id="template" src="" alt="图片" width="40" height="40">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">PC端模板</label>
                                                <div class="col-md-9">
                                                    <select name="mtemplate" class="form-control input-medium" onchange="showTempIMG(this)">

                                                    </select>
                                                    <img id="mtemplate" src="" alt="图片" width="40" height="40">
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
                    <!-- BEGIN PAGE CONTENT-->
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light" style="margin-bottom: 10px;">
                        <div class="portlet-body">
                            <div class="table-toolbar">
                                <div class="form-inline">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="btn-group pull-right">
                                                <button data-command="add" class="btn green">
                                                    <i class="fa fa-plus"></i> 添加品牌
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="align-center">
                                        <th width="8%">ID</th>
                                        <th width="10%">商户</th>
                                        <th width="10%">品牌名称</th>
                                        <th width="10%">品牌代号</th>
                                        <th width="16%">移动端模板</th>
                                        <th>PC端模板</th>
                                        <th width="8%">状态</th>
                                        <th class="three">操作</th>
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

                    <div id="modal-add" class="modal fade" data-backdrop="static" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"></button>
                                    <h4 class="modal-title"></h4>
                                </div>
                                <div class="modal-body" style="padding: 30px 20px 15px 20px;">
                                    <form class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">商户名</label>
                                                <div class="col-md-9">
                                                    <select name="merchantCode" class="form-control input-medium">
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">品牌名称</label>
                                                <div class="col-md-9">
                                                    <input name="name" class="form-control input-inline input-medium" type="text" >
                                                    <span class="help-inline"></span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">品牌代号</label>
                                                <div class="col-md-9">
                                                    <input name="code" class="form-control input-inline input-medium" type="text">
                                                    <span class="help-inline"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">状态</label>
                                                <div class="col-md-9">
                                                    <div class="radio-list">
                                                        <input type="radio" name="status" value="1" checked>启用
                                                        <input type="radio" name="status" value="2">禁用
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">移动端模板</label>
                                                <div class="col-md-9">
                                                    <select name="template" class="form-control input-medium" onchange="showTempIMG(this)">

                                                    </select>
                                                    <img id="add-template" src="" alt="图片" width="40" height="40">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">PC端模板</label>
                                                <div class="col-md-9">
                                                    <select name="mtemplate" class="form-control input-medium" onchange="showTempIMG(this)">

                                                    </select>
                                                    <img id="add-mtemplate" src="" alt="图片" width="40" height="40">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="add-sub" data-command="submit" class="btn green-meadow"><i class="fa fa-check"></i> 确认</button>
                                    <button type="button" data-dismiss="modal" class="btn default"><i class="fa fa-undo"></i> 取消</button>
                                </div>
                            </div>
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
<script src="${cdnDomain}theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/plugins/jquery.easyweb/jquery.easyweb.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${cdnDomain}theme/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/global/scripts/md5.js" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>

<script src="${cdnDomain}theme/assets/custom/scripts/global.js?v=${cdnVersion}" type="text/javascript"></script>
<script src="${cdnDomain}theme/assets/admin/pages/scripts/merchant-brand.js?v=${cdnVersion}" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        // init data
        list.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>