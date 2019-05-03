var homeCategoryController = {
    init: function () {
        homeCategoryController.getDisplayOrder(0, "none");
        setTimeout(function () {
            homeCategoryController.loadHomeCategory();
        }, 200);
        homeCategoryController.setFormatToastr();
        homeCategoryController.registerEvents();
    },
    registerEvents: function () {
        $('#minusHomeCategory').off('click').on('click', function () {
            homeCategoryController.getDisplayOrder(parseInt($('#displayOrderHomeCategory').val()), "minus");
        });
        $('#plusHomeCategory').off('click').on('click', function () {
            homeCategoryController.getDisplayOrder(parseInt($('#displayOrderHomeCategory').val()), "plus");
        });
        $('#btnAddHomeCategory').off('click').on('click', function () {
            homeCategoryController.resetForm();
            $('#createEditHomeCategory').html("Thêm Mới");
        });
        $('#createEditHomeCategory').off('click').on('click', function () {
            if ($('#nameHomeCategory').val() != "" && $('#linkHomeCategory').val() != "") {
                homeCategoryController.createEditHomeCategory();
                $('#createEditHomeCategory').html("Thêm Mới");
            }
            else {
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
            }
        });
        $('.btn-edit-homecategory').off('click').on('click', function () {
            $('#createEditHomeCategory').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            homeCategoryController.loadHomeCategoryDetail(id);
        });
        $('.btn-delete-homecategory').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?")) {
                homeCategoryController.deleteHomeCategory(id);
                homeCategoryController.resetForm();
            }
                
        });
        $('.btn-stt-homecategory').off('click').on('click', function () {
            var id = $(this).data('id');
            var btn = $(this);
            homeCategoryController.changeStatus(id, btn);
        });
    },
    loadHomeCategory: function(){
        $.ajax({
            url: '/Admin/HomeCategory/GetListHomeCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = "";
                var htmlChild = "";
                var categoryData = $('#homeCategory-data').html();
                $.each(response.data, function (i, item) {
                    html += Mustache.render(categoryData, {
                        ID: item.ID,
                        Name: item.Text,
                        DisplayOrder: item.DisplayOrder,
                        Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                    });
                });
                $('#listHomeCaterogy').html(html);
                homeCategoryController.registerEvents();
            },
        })
    },
    createEditHomeCategory: function () {
        var id = parseInt($('#idHomeCategory').val());
        var name = $('#nameHomeCategory').val();
        var link = $('#linkHomeCategory').val();
        var target = $('#targetHomeCategory').val();
        var displayOrder = parseInt($('#displayOrderHomeCategory').val());
        var stt = $('#statusCarCategory').prop("checked");
        var HomeCategory = {
            ID: id,
            Text: name,
            Link: link,
            Target: target,
            DisplayOrder: displayOrder,
            Status: stt
        };
        $.ajax({
            url: '/Admin/HomeCategory/CreateEditHomeCategory',
            data: {
                strHomeCategory: JSON.stringify(HomeCategory)
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.result == 1) {
                    toastr.success("Thêm danh mục trang chủ thành công!", "Success");
                    homeCategoryController.loadHomeCategory();
                    setTimeout(function () {
                        homeCategoryController.resetForm();
                    }, 200);
                }
                else if (response.result == 2) {
                    toastr.success("Chỉnh sửa danh mục trang chủ thành công!", "Success");
                    homeCategoryController.loadHomeCategory();
                    setTimeout(function () {
                        homeCategoryController.resetForm();
                    }, 200);
                }
                else {
                    var str = id == 0 ? "Thêm danh mục trang chủ không thành công!" : "Chỉnh sửa danh mục trang chủ không thành công!"
                    toastr.error(str, "Error");
                }
            }
        })
    },
    loadHomeCategoryDetail: function (Id) {
        $.ajax({
            url: '/Admin/HomeCategory/LoadHomeCategoryDetail',
            data: {
                Id: Id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idHomeCategory').val(data.ID);
                $('#nameHomeCategory').val(data.Text);
                $('#linkHomeCategory').val(data.Link);
                $('#displayOrderHomeCategory').val(data.DisplayOrder);
                $('#targetHomeCategory').val(data.Target);
                $('#statusHomeCategory').prop("checked",data.Status);
            }
        })
    },
    deleteHomeCategory: function(Id){
        $.ajax({
            url: '/Admin/HomeCategory/DeleteHomeCategory',
            data: {
                Id: Id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá danh mục trang chủ thành công!", "Success");
                    homeCategoryController.loadHomeCategory();
                }
                else {
                    toastr.error("Xoá danh mục trang chủ không thành công!", "Fail");
                }
            },
        });
    },
    changeStatus: function (Id,btn) {
        $.ajax({
            url: '/Admin/HomeCategory/ChangeStatus',
            data: { Id: Id },
            type: 'POST',
            dataTyp: 'json',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                btn.html(html);
            }
        });
    },
    getDisplayOrder: function (display,cal) {
        $.ajax({
            url: '/Admin/HomeCategory/GetDisplayOrder',
            data: {
                display: display,
                cal: cal
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.res != 0) $('#displayOrderHomeCategory').val(response.res);
                else {
                    toastr.warning("Thứ Tự Hiển Thị Đã Nhỏ Nhất Có Thể", "Warning");
                }
            }
        })
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
    resetForm: function () {
        $('#idHomeCategory').val(0);
        $('#nameHomeCategory').val("");
        $('#linkHomeCategory').val("");
        homeCategoryController.getDisplayOrder(0, "none");
        $('#statusHomeCategory').prop('checked', false);
    },
}
homeCategoryController.init();