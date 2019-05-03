var manufacturerconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var manufacturerController = {
    init: function () {
        manufacturerController.loadManufacturer();
        manufacturerController.setFormatToastr();
        manufacturerController.registerEvents();
    },
    registerEvents: function () {
        $('#btnCreateManufacturer').off('click').on('click', function () {
            $('#title-manufacturer').html("Thêm Mới Nhà Sản Xuất");
            $('#createEditManufacturer').html("Thêm Mới");
            manufacturerController.resetForm();
            $('#createEditManufacturerModal').modal('show');
        });
        $('#createEditManufacturer').off('click').on('click', function () {
            if ($('#nameManufacturer').val() != "") {
                manufacturerController.createEditManufacturer();
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-manufacturer').off('click').on('click', function () {
            $('#title-manufacturer').html("Chỉnh Sửa Thông Tin Nhà Sản Xuất");
            $('#createEditManufacturer').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            manufacturerController.loadManufacturerById(id);
            $('#createEditManufacturerModal').modal('show');
        });
        $('.btn-delete-manufacturer').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                manufacturerController.deleteManufacturer($(this).data('id'));
        });
        $('.btn-status-manufacturer').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            manufacturerController.changeStatusManufacturer(id, btn);
        });
    },
    loadManufacturer: function () {
        $.ajax({
            url: '/Admin/Manufacturer/LoadManufacturer',
            data: {
                page: manufacturerconfig.pageIndex,
                pageSize: manufacturerconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var manufacturerData = $('#manufacturer-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(manufacturerData, {
                            ID: item.ID,
                            Name: item.Name,
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    });
                    $('#tblManufacturer').html(html);
                    if (response.totalRowManufacturer > 0) {
                        manufacturerController.pagingManufacturer(response.totalRowManufacturer, function () {
                            manufacturerController.loadManufacturer(manufacturerconfig.pageIndex, manufacturerconfig.pageSize);
                        })
                    }
                    manufacturerController.registerEvents();
                };
            },
        });
    },
    loadManufacturerById: function (id) {
        $.ajax({
            url: '/Admin/Manufacturer/GetManufacturerById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idManufacturer').val(data.ID);
                $('#nameManufacturer').val(data.Name);
                $('#statusManufacturer').prop('checked', data.Status);
            },
        })
    },
    createEditManufacturer: function () {
        var id = $('#idManufacturer').val();
        var name = $('#nameManufacturer').val();
        var status = $('#statusManufacturer').prop('checked');
        var Manufacturer = {
            ID: id,
            Name: name,
            Status: status,
        };
        $.ajax({
            url: '/Admin/Manufacturer/CreateEditManufacturer',
            data: {
                strManufacturer: JSON.stringify(Manufacturer),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm nhà sàn xuất thành công!", "Success");
                    manufacturerController.loadManufacturer();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin nhà sản xuất thành công!", "Success");
                    manufacturerController.loadManufacturer();
                }
                else toastr.error("Thêm nhà sản xuất không thành công!", "Error");
                $('#createEditManufacturerModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditManufacturerModal').modal('hide');
            }
        })
    },
    deleteManufacturer: function (id) {
        $.ajax({
            url: '/Admin/Manufacturer/DeleteManufacturer',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    manufacturerController.loadManufacturer();
                }
                else if (response.res == 2) {
                    toastr.warning("Bản ghi này đang được sử dụng Danh Sách Phụ Tùng hoặc Ôtô!", "Warning");
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    changeStatusManufacturer: function (id, btn) {
        $.ajax({
            url: '/Admin/Manufacturer/ChangeStatus',
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
        $('#idManufacturer').val(0);
        $('#nameManufacturer').val('');
        $('#statusManufacturer').prop('checked', false);
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
    pagingManufacturer: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / manufacturerconfig.pageSize);
        $('#pagination-manufacturer').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                manufacturerconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
}
manufacturerController.init();