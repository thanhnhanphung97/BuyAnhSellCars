var originconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var originController = {
    init: function () {
        originController.loadOrigin();
        originController.registerEvents();
        originController.setFormatToastr();
    },
    registerEvents: function () {
        $('#btnCreateOrigin').off('click').on('click', function () {
            $('#title-origin').html("Thêm Mới Xuất Sứ");
            $('#createEditOrigin').html("Thêm Mới");
            originController.resetForm();
            $('#createEditOriginModal').modal('show');
        });
        $('#createEditOrigin').off('click').on('click', function () {
            if ($('#nameOrigin').val() != ""){
                originController.createEditOrigin();
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-origin').off('click').on('click', function () {
            $('#title-origin').html("Chỉnh Sửa Thông Tin Xuất Sứ");
            $('#createEditOrigin').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            originController.loadOriginById(id);
            $('#createEditOriginModal').modal('show');
        });
        $('.btn-delete-origin').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                originController.deleteOrigin($(this).data('id'));
        });
        $('.btn-status-origin').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            originController.changeStatusOrigin(id, btn);
        });
    },
    loadOrigin: function () {
        $.ajax({
            url: '/Origin/LoadOrigin',
            data: {
                page: originconfig.pageIndex,
                pageSize: originconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var originData = $('#origin-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(originData, {
                            ID: item.ID,
                            Name: item.Name,
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    });
                    $('#tblOrigin').html(html);
                    if (response.totalRowOrigin > 0) {
                        originController.pagingOrigin(response.totalRowOrigin, function () {
                            originController.loadOrigin(originconfig.pageIndex, originconfig.pageSize);
                        })
                    }
                    originController.registerEvents();
                };
            },
        });
    },
    loadOriginById: function (id) {
        $.ajax({
            url: '/Origin/GetOriginById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idOrigin').val(data.ID);
                $('#nameOrigin').val(data.Name);
                $('#statusOrigin').prop('checked', data.Status);
            },
        })
    },
    createEditOrigin: function () {
        var id = $('#idOrigin').val();
        var name = $('#nameOrigin').val();
        var status = $('#statusOrigin').prop('checked');
        var Origin = {
            ID: id,
            Name: name,
            Status: status,
        };
        $.ajax({
            url: '/Origin/CreateEditOrigin',
            data: {
                strOrigin: JSON.stringify(Origin),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm xuất sứ thành công!", "Success");
                    originController.loadOrigin();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin xuất sứ thành công!", "Success");
                    originController.loadOrigin();
                }
                else toastr.error("Thêm xuất sứ không thành công!", "Error");
                $('#createEditOriginModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditOriginModal').modal('hide');
            }
        })
    },
    deleteOrigin: function (id) {
        $.ajax({
            url: '/Origin/DeleteOrigin',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    originController.loadOrigin();
                }
                else if (response.res == 2) {
                    toastr.warning("Bản ghi này đang được sử dụng trong Danh Sách Phụ Tùng hoặc Ôtô!", "Warning");
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    changeStatusOrigin: function (id, btn) {
        $.ajax({
            url: '/Origin/ChangeStatus',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.used == false) {
                    var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                    btn.html(html);
                }
                else toastr.warning("Bản ghi này đang được sử dụng trong Danh Sách Phụ Tùng hoặc Ôtô!", "Warning");
            }
        })
    },
    resetForm: function () {
        $('#idOrigin').val(0);
        $('#nameOrigin').val('');
        $('#statusOrigin').prop('checked', false);
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
    pagingOrigin: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / originconfig.pageSize);
        $('#pagination-origin').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                originconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
}

originController.init();