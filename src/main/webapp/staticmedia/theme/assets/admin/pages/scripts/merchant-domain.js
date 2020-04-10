$(document).ready(function () {
    var tableList = $('#table-merchant-list');
    var tablePagelist = tableList.find('.page-list');
    brandList($('#search-brand'),-1);
    search("./merchant-brand-domain/search",0);
    validation($('#modal-add'), "add");
    validation($('#modal-modify'), "modify");
    tableList.find('[data-command="search"]').unbind('click').click(function () {
        var page = $('#page').text();
        search("./merchant-brand-domain/search",page);
    });
    function search(url,page) {
        var end = $('#end').val();
        if (end && page > end) {
            page = end;
        }
        if (page <= 0) {
            page = 1;
        }

        var obj = $('#search-brand');
        var brand = obj.find("option:selected").val();
        var domain = $('#search-domain').val();
        var data = {brand:brand,domain:domain,page:(page - 1)*10,pageSize:10};
        $.ajax({
            type: 'post',
            url: url,
            data: data,
            dataType: 'json',
            success: function (list) {
                var table = $('#tab-tbody');
                var innerHtml = '';
                $.each(list.data, function (idx, val) {

                    innerHtml +=
                        '<tr class="align-center" data-id="' + val.id + '">' +
                        '<td>' + val.brandCode + '</td>' +
                        '<td>' + val.merchantCode + '</td>' +
                        // '<td>' + val.name + '</td>' +
                        // '<td>' + val.type + '</td>' +
                        '<td>' + val.domain + '</td>' +
                        // '<td>' + val.isfalse + '</td>' +
                        // '<td>' + val.status + '</td>' +
                        '<td>' +
                        '<button class="btn gray" data-toggle="modal" data-target="#modal-modify" ' +
                        'onclick="modify('+val.id+')">' +
                        '修改' +
                        '</button>'+
                        '<button class="btn gray" data-toggle="modal" data-target=""' +
                        'onclick="dele('+val.id+')">' +
                        '删除' +
                        '</button>'+
                        '</td>' +
                        '</tr>';
                });
                table.html(innerHtml);
                var totalCount = list.totalCount;
                var tatalPage = Math.ceil(totalCount / 10);
                $('#totalCount').text(totalCount);
                $('#page').text(page);
                $('#totalPage').text(tatalPage);
                $('#end').val(tatalPage);
                $('#inputPage').val();
                /*查询结果为空*/
                if (list.data.length == 0) {
                    var tds = tableList.find('thead tr th').size();
                    tableList.find('table > tbody').html('<tr><td colspan="' + tds + '">没有相关数据</td></tr>');
                    $('#page').text(0);
                }
            }
        });
    }

    $('#btn-add').click(function () {
        var innerhtml = '<div class="form-body">' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">品牌</label>' +
            '<div class="col-md-9">' +
            '<select id="add-brand" name="brandId"></select>' +
            '</div>' +
            '</div>' +
            '<div class="form-group">' +
            '<label class="col-md-3 control-label">域名</label>' +
            '<div class="col-md-9">' +
            '<input name="domain" class="form-control input-inline input-medium" autocomplete="off" type="text">' +
            '<span class="help-inline" data-default="">请输入域名。</span>' +
            '</div>' +
            '</div>' +
            '</div>';
        $('#add-form').html(innerhtml);
        brandList($("#add-brand"), 1);
    });

    $('#modal-add').click(function () {
        validation(this,"add");
    });

    $('#modal-modify').click(function () {
        validation(this,"modify");
    });

    function validation(obj,action) {
        var modal = $(obj);
        var form = modal.find('form');

        form.validate({
            rules: {
                domain: {
                    required: true
                }
            },
            messages: {
                domain: {
                    required: '域名不能为空！'
                }
            },
            invalidHandler: function (event, validator) {},
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
        modal.find('[data-command="submit"]').unbind('click').click(function() {
            if(form.validate().form()) {
                if (action == "add")
                    sub();
                else if(action == "modify")
                    sub1();
            }
        });
    }

    /*首页*/
    $('#top').click(function () {
        search("./merchant-brand-domain/search", 1);
    })
    /*尾页*/
    $('#end').click(function () {
        var page = $('#end').val();
        search("./merchant-brand-domain/search", parseInt(page));
    });
    /*上页*/
    $('#prev').click(function () {
        var page = $('#page').text();
        search("./merchant-brand-domain/search", parseInt(page) - 1);
    });
    /*下页*/
    $('#next').click(function () {
        var page = $('#page').text();
        search("./merchant-brand-domain/search", parseInt(page) + 1);
    });
    $('#btn-go').click(function () {
        var page = $('#inputPage').val();
        if(!page || page == ''){
            page = 1;
        }
        search("./merchant-brand-domain/search", parseInt(page));
    });
});
/*信息修改*/
function modify(id) {

    var innerhtml = '<div class="form-group">' +
        '<label class="col-md-3 control-label">品牌</label>' +
        '<div class="col-md-9">' +
        '<select id="brand" name="brandId" >' +
        '</select>' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<label class="col-md-3 control-label">域名</label>' +
        '<div class="col-md-9">' +
        '<input id="domain" name="domain" class="form-control input-inline input-medium"' +
        ' autocomplete="off" type="text">' +
        '<span class="help-inline" data-default=""></span>' +
        '</div>' +
        '</div>' +
        '<div class="form-group">' +
        '<div class="col-md-9">' +
        '<input id="id" name="id" class="form-control input-inline input-medium"' +
        ' autocomplete="off" type="hidden">' +
        '</div>' +
        '</div>';

    $('#modify-form').html(innerhtml);

    $.ajax({
        type: 'post',
        url: '/merchant-brand-domain/get',
        data: "id="+id,
        dataType: 'json',
        success: function (bean) {
            // $('#merchantCode').val(bean.merchantCode);
            var brand = parseInt(bean.brandId);
            brandList($('#brand'), brand);

            $('#domain').val(bean.domain);
            $('#id').val(bean.id);
            $('#modal-modify').modal;
        }
    });
}
/*新增提交*/
function sub() {
    var data = $("form:first").serialize()
    $.ajax({
        type: 'post',
        url: '/merchant-brand-domain/add',
        data: data,
        dataType: 'json',
        success: function (data) {
            if (data.error == "0") {
                alert(data.message);
                $('#modal-add').modal("hide");
                window.location.reload();
            }else{
                alert(data.message);

            }
        }
    });
}
/*修改提交*/
function sub1() {
    var data = $("form:last").serialize();
    $.ajax({
        type: 'post',
        url: '/merchant-brand-domain/update',
        data: data,
        dataType: 'json',
        success: function (data) {
            if (data.error == "0") {
                alert(data.message);
                $('#modal-add').modal("hide");
                window.location.reload();
            }else{
                alert(data.message);

            }
        }
    });
}
function brandList(obj,index) {
    $.ajax({
        type: 'post',
        url: '/merchant-brand/getlist',
        data: '',
        dataType: 'json',
        success: function (list) {
            var innerhtml = '<option value="0" selected>请选择</option>'
            $.each(list,function (idx, val) {
                if (val.id == index)
                    innerhtml += '<option value="'+val.id+'" selected>'+val.code+'</option>';
                else
                    innerhtml += '<option value="'+val.id+'">'+val.code+'</option>';
            })
            $(obj).html(innerhtml);
        }
    })
}
function dele(id) {

    if (confirm("请确认是否删除该域名")) {
        $.ajax({
            type: 'post',
            url: '/merchant-brand-domain/delete',
            data: 'id='+id,
            dataType: 'json',
            success: function (data) {
                if (data.error == "0") {
                    alert(data.message);
                    $('#modal-modify').modal("hide");
                    window.location.reload();
                }else{
                    alert(data.message);

                }
            }
        });
    }

}


