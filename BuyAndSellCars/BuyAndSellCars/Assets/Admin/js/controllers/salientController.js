var salientconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var salientController = {
    init: function () {
        salientController.loadSalient();
        salientController.registerEvents();
        salientController.setFormatToastr();
    },
    registerEvents: function () {
        $('#btnCreateSalient').off('click').on('click', function () {
            $('#title-salient').html("Thêm Mới Tính Năng");
            $('#createEditSalient').html("Thêm Mới");
            salientController.resetForm();
            $('#createEditSalientModal').modal('show');
        });
        $('#createEditSalient').off('click').on('click', function () {
            if ($('#nameSalient').val() != "") {
                salientController.createEditSalient();
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-salient').off('click').on('click', function () {
            $('#title-salient').html("Chỉnh Sửa Thông Tin Tính Năng");
            $('#createEditSalient').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            salientController.loadSalientById(id);
            $('#createEditSalientModal').modal('show');
        });
        $('.btn-delete-salient').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                salientController.deleteSalient($(this).data('id'));
        });
        $('.btn-status-salient').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            salientController.changeStatusSalient(id, btn);
        });
    },
    loadSalient: function () {
        $.ajax({
            url: '/Salient/LoadSalient',
            data: {
                page: salientconfig.pageIndex,
                pageSize: salientconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var salientData = $('#salient-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(salientData, {
                            ID: item.ID,
                            Name: item.Name,
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    });
                    $('#tblSalient').html(html);
                    if (response.totalRowSalient > 0) {
                        salientController.pagingSalient(response.totalRowSalient, function () {
                            salientController.loadSalient(salientconfig.pageIndex, salientconfig.pageSize);
                        })
                    }
                    salientController.registerEvents();
                };
            },
        });
    },
    loadSalientById: function (id) {
        $.ajax({
            url: '/Salient/GetSalientById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idSalient').val(data.ID);
                $('#nameSalient').val(data.Name);
                $('#statusSalient').prop('checked', data.Status);
            },
        })
    },
    createEditSalient: function () {
        var id = $('#idSalient').val();
        var name = $('#nameSalient').val().toString().replace('/,','-');
        var status = $('#statusSalient').prop('checked');
        var Salient = {
            ID: id,
            Name: name,
            Status: status,
        };
        $.ajax({
            url: '/Salient/CreateEditSalient',
            data: {
                strSalient: JSON.stringify(Salient),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm tính năng thành công!", "Success");
                    salientController.loadSalient();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin tính năng thành công!", "Success");
                    salientController.loadSalient();
                }
                else toastr.error("Thêm tính năng không thành công!", "Error");
                $('#createEditSalientModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditSalientModal').modal('hide');
            }
        })
    },
    deleteSalient: function (id) {
        $.ajax({
            url: '/Salient/DeleteSalient',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    salientController.loadSalient();
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    changeStatusSalient: function (id, btn) {
        $.ajax({
            url: '/Salient/ChangeStatus',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                btn.html(html);
            }
        })
    },
    resetForm: function () {
        $('#idSalient').val(0);
        $('#nameSalient').val('');
        $('#statusSalient').prop('checked', false);
    },
    setFormatToastr: function () {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "2000",
            "extendedTimeOut": "500",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    },
    pagingSalient: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / salientconfig.pageSize);
        setTimeout(function () {
            $('#pagination-salient').twbsPagination({
                totalPages: totalPage,
                visiblePages: 5,
                first: "Đầu",
                prev: "Trước",
                next: "Tiếp",
                last: "Cuối",
                onPageClick: function (event, page) {
                    salientconfig.pageIndex = page;
                    setTimeout(callback, 200);
                },
            });
        }, 200);
    },
}
