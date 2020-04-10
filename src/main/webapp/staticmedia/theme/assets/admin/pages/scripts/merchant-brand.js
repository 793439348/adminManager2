$(document).ready(function () {

    var tableList = $('#table-merchant-list');
    var tablePagelist = tableList.find('.page-list');

    function search(url) {
        $.ajax({
            type: 'post',
            url: url,
            data: '',
            dataType: 'json',
            success: function (list) {
                var table = $('#tab-tbody');
                var innerHtml = '';
                $.each(list.data, function (idx, val) {
                    var type = '';
                    if (val.status == 0) {
                        type = '<form method="post" action="">' +
                            '<input type="radio" name="m-type" value="0" checked>启用' +
                            '<input type="radio" name="m-type" value="1">停用' +
                            '</form>';
                    } else if (val.status == 1) {
                        type = '<form method="post" action="">' +
                            '<input type="radio" name="m-type" value="0" >启用' +
                            '<input type="radio" name="m-type" value="1" checked>停用' +
                            '</form>';
                    }
                    var templeImg = '';
                    var mtempleImg = '';
                    if (val.templete) {
                        templeImg = val.templete.smallImage +"?"+randomNum();
                    }
                    if (val.mtemplete) {
                        mtempleImg = val.mtemplete.smallImage +"?"+randomNum();

                    }
                    innerHtml +=
                        '<tr class="align-center" data-id="' + val.id + '">' +
                        '<td>' + val.id + '</td>' +
                        '<td>' + val.merchantCode + '</td>' +
                        '<td>' + val.name + '</td>' +
                        '<td>' + val.code + '</td>' +
                        '<td>' + '<img src="' + templeImg + '" alt="图片" width="40" height="40">' + '</td>' +
                        '<td>' + '<img src="' + mtempleImg + '" alt="图片" width="40" height="40">' + '</td>' +
                        '<td>' + type + '</td>' +
                        '<td>' +
                        '<button class="btn gray" data-toggle="modal" data-target="#modal-modify" ' +
                        'onclick="modify(' + val.id + ')">' +
                        '修改' +
                        '</button>' +
                        '</td>' +
                        '</tr>';
                });
                table.html(innerHtml);

                /*查询结果为空*/
                if (list.data.length == 0) {
                    var tds = tableList.find('thead tr th').size();
                    tableList.find('table > tbody').html('<tr><td colspan="' + tds + '">没有相关数据</td></tr>');
                    $('#page').text(0);
                }

                $("input[name=m-type]").click(function () {
                    var type = this.value;
                    var id = $(this).parent().parent().siblings(":first").text();
                    modifyType(id, type);
                });

            }
        });
    }

    search("./merchant-brand/list");
    validation($('#modal-add'));
    validationModify($('#modal-modify'));
    tableList.find('[data-command="search"]').unbind('click').click(function () {
        search("./merchant-brand/list");
    });

    $('#btn-add').click(function () {
        var innerhtml = '<div class="form-body">' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">商户名</label>' +
            '<div class="col-md-9">' +
            '<select id="merchantCode" name="merchantId">' +
            '</select>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">品牌名称</label>' +
            '<div class="col-md-9">' +
            '<input name="name" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
            '<span class="help-inline" data-default="">请填写品牌名称。</span>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">品牌代号</label>' +
            '<div class="col-md-9">' +
            '<input name="code" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
            '<span class="help-inline" data-default="">请输入品牌代号。</span>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">状态</label>' +
            '<div class="col-md-9">' +
            '<input type="radio" name="status" value="0" checked="">启用' +
            '<input type="radio" name="status" value="1">停用' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">移动端模板</label>' +
            '<div class="col-md-9">' +
            '<select id="add-temp" name="templete" onchange="showTempIMG(this)">' +
            '</select>' +
            '<br/>' +
            '<img src="" alt="预览图" width="40" height="40">' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">PC端模板</label>' +
            '<div class="col-md-9">' +
            '<select id="add-mtemp" name="mtemplete" onchange="showTempIMG(this)">' +
            '</select>' +
            '<br/>' +
            '<img src="" alt="预览图" width="40" height="40">' +
            '</div>' +
            '</div>' +
            '</div>';

        $('#add-form').html(innerhtml);

        findMerchant($('#merchantCode'),null);
        findTemplete($("#add-temp"),null, $("#add-mtemp"),null);
    })

    function validation(obj) {
        var modal = $(obj);
        var form = modal.find('form');

        form.validate({
            rules: {
                name: {
                    required: true,
                    minlength: 4,
                    maxlength: 20
                },
                code: {
                    required: true,
                    minlength: 4,
                    maxlength: 10,
                    remote: {
                        url: '/merchant-brand/notexists',
                        type: 'post'
                    }
                }
            },
            messages: {
                name: {
                    required: '品牌名称不能为空！',
                    minlength: '至少输入{0}个字符',
                    maxlength: '最多输入{0}个字符'
                },
                code: {
                    required: '品牌代号不能为空！',
                    minlength: '至少输入{0}个字符',
                    maxlength: '最多输入{0}个字符',
                    remote: '品牌代号已存在！'
                }
            },
            invalidHandler: function (event, validator) {
            },
            errorPlacement: function (error, element) {
                $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-warning"></i> ' + error.text());
            },
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-check"></i> 填写正确。');
            }
        });
        modal.find('[data-command="submit"]').unbind('click').click(function () {
            if (form.validate().form()) {
                sub();
            }
        });
    }

    $('#modal-add').click(function () {
        validation(this);
    });
    $('#modal-modify').click(function () {
        validationModify(this);
    });

    function validationModify(obj) {
        var modal = $(obj);
        var form = modal.find('form');

        form.validate({
            rules: {
                name: {
                    required: true,
                    minlength: 4,
                    maxlength: 20
                }
            },
            messages: {
                name: {
                    required: '品牌名称不能为空！',
                    minlength: '至少输入{0}个字符',
                    maxlength: '最多输入{0}个字符'
                }
            },
            invalidHandler: function (event, validator) {
            },
            errorPlacement: function (error, element) {
                $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-warning"></i> ' + error.text());
            },
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                $(element).closest('.form-group').find('.help-inline').html('<i class="fa fa-check"></i> 填写正确。');
            }
        });
        modal.find('[data-command="submit"]').unbind('click').click(function () {
            if (form.validate().form()) {
                sub1();
            }
        });
    }

});

/*修改*/
function modify(id) {

    var innerhtml = '<div class="form-group">' +
        '<label class="col-md-3 control-label">商户名</label>' +
        '<div class="col-md-9">' +
        '<select id="mName" name="merchantId">' +
        '</select>' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">品牌名称</label>' +
        '<div class="col-md-9">' +
        '<input id="bName" name="name" class="form-control input-inline input-medium"' +
        ' autocomplete="off" type="text">' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">品牌代号</label>' +
        '<div class="col-md-9">' +
        '<input id="brand-code" name="code" class="form-control input-inline input-medium"' +
        ' autocomplete="off" type="text" >' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">状态</label>' +
        '<div id="status" class="col-md-9">' +
        '<input type="radio" name="status" value="0">启用' +
        '<input type="radio" name="status" value="1">停用' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">移动端模板</label>' +
        '<div class="col-md-9">' +
        '<select id="modify-temp" name="templete" onchange="showTempIMG(this)">' +
        '</select>' +
        '<br/>' +
        '<img id="b-templete" src="" alt="图片" width="40" height="40">' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">PC端模板</label>' +
        '<div class="col-md-9">' +
        '<select id="modify-mtemp" name="mtemplete" onchange="showTempIMG(this)">' +
        '</select>' +
        '<br/>' +
        '<img id="b-mtemplete" src="" alt="图片" width="40" height="40">' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<div class="col-md-9">' +
        '<input type="hidden" name="id" id="hid-id">' +
        '</div>' +
        '</div>';

    $('#modify-form').html(innerhtml);

    $.ajax({
        type: 'post',
        url: '/merchant-brand/get',
        data: "id=" + id,
        dataType: 'json',
        success: function (bean) {
            $('#bName').val(bean.name);
            $('#brand-code').val(bean.code);

            // $('#b-templete').attr("src", bean.templete.smallImage+"?"+randomNum());
            // $('#b-mtemplete').attr("src", bean.mtemplete.smallImage+"?"+randomNum());
            $('#hid-id').val(bean.id);
            var ipts = $('#status').find('input');
            $(ipts[bean.status]).attr("checked", "checked");
            $('#modal-modify').modal;

            findMerchant($('#mName'), bean.merchantCode);
            findTemplete($("#modify-temp"), bean.templete.id, $("#modify-mtemp"), bean.mtemplete.id);
        }
    });


}

/*新增提交*/
function sub() {
    var data = $("form:first").serialize();
    $.ajax({
        type: 'post',
        url: '/merchant-brand/add',
        data: data,
        dataType: 'json',
        success: function (data) {
            if (data.error == "0") {
                alert(data.message);
                $('#modal-add').modal("hide");
                window.location.reload();
            } else {
                alert(data.message)
            }
        }
    });
}

/*修改提交*/
function sub1() {
    var data = $("form:last").serialize();
    $.ajax({
        type: 'post',
        url: '/merchant-brand/update',
        data: data,
        dataType: 'json',
        success: function (data) {
            if (data.error == 0) {
                alert(data.message);
                $('#modal-modify').modal("hide");
                window.location.reload();
            } else {
                alert(data.message)
            }
        }
    });
}

function modifyType(id, type) {
    $.ajax({
        type: 'post',
        url: '/merchant-brand/modify-type',
        data: "id=" + id + "&status=" + type,
        dataType: 'json',
        success: function (dat) {
            if (data.error != 0) {
                alert(dat.message);
            }
        }
    });
}

function addBrand() {
    findMerchant($("#merchantCode"),null);
    findTemplete($("#add-temp"),null, $("#add-mtemp"),null);

}

function findTemplete(obj1, obj1Id, obj2, obj2Id) {
    $.ajax({
        type: 'post',
        url: '/site-template/list',
        data: '',
        dataType: "json",
        success: function (list) {
            var innerhtml1 = '';
            var innerhtml2 = '';
            var boo1 = true;
            var boo2 = true;
            var src1 = '';
            var src2 = '';
            $.each(list, function (idx, val) {
                if (val.type == 1) {
                    /*手机端*/
                    if (boo1 && obj1Id == val.id) {
                        src1 = val.smallImage;
                        boo1 = false;
                        innerhtml1 += '<option value="' + val.code + '" selected>' + val.code + '</option>';
                    }else if(boo1 && !obj1Id){
                        src1 = val.smallImage;
                        boo1 = false;
                        innerhtml1 += '<option value="' + val.code + '" selected>' + val.code + '</option>';
                    }else {
                        innerhtml1 += '<option value="' + val.code + '">' + val.code + '</option>';
                    }
                } else if (val.type == 2) {
                    /*pc端*/
                    if (boo2 && obj2Id == val.id ) {
                        src2 = val.smallImage;
                        boo2 = false;
                        innerhtml2 += '<option value="' + val.code + '" selected>' + val.code + '</option>';
                    }else if (boo2 && !obj2Id){
                        src2 = val.smallImage;
                        boo2 = false;
                        innerhtml2 += '<option value="' + val.code + '" selected>' + val.code + '</option>';
                    }else {
                        innerhtml2 += '<option value="' + val.code + '" >' + val.code + '</option>';
                    }
                }
            });
            $(obj1).html(innerhtml1);
            $(obj2).html(innerhtml2);
            $(obj1).next().next().attr("src", src1+"?"+randomNum());
            $(obj2).next().next().attr("src", src2+"?"+randomNum());

        }
    });
}

function showTempIMG(obj) {
    var code = $(obj.options[obj.selectedIndex]).val();
    $.ajax({
        type: 'post',
        url: '/site-template/getbycode',
        data: 'code=' + code,
        dataType: "json",
        success: function (data) {
            $(obj).next().next().attr("src", data.smallImage+"?"+randomNum());
        }
    })
}

function findMerchant(obj, code) {
    $.ajax({
        type: 'post',
        url: '/merchant/getlist',
        data: '',
        dataType: "json",
        success: function (data) {
            var innerhtml = '';
            if (data.length != 0) {
                $.each(data, function (idx, val) {
                    if (val.code == code)
                        innerhtml += '<option value="' + val.id + '" selected>' + val.code + '</option>';
                    else
                        innerhtml += '<option value=' + val.id + ' >' + val.code + '</option>';
                })
            } else {
                innerhtml = '<option value="0" >无商户信息</option>';
            }
            ;

            $(obj).html(innerhtml);
        }
    })
}

function randomNum() {
    //x上限，y下限
    var x = 1000000;
    var y = 0;
    var rand = parseInt(Math.random() * (x - y + 1) + y);
    return rand;
}