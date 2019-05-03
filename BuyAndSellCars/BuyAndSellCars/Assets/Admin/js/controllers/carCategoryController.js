categoryConfig = {
     
}

var carCategoryController = {
    init: function () {
        carCategoryController.getDisplayOrder(0, 0, "none");
        setTimeout(function () {
            carCategoryController.loadCarCategory();
        }, 200);
        carCategoryController.setFormatToastr();
        carCategoryController.registerEvents();
    },
    registerEvents: function () {
        $('#selectCarCategory').off('click').on('change', function () {
            if (parseInt($('#selectCarCategory').val()) == 0) {
                carCategoryController.getDisplayOrder(0, 0, "none");
                $('#selectCarCategoryChild').prop('hidden', true);
            }
            else {
                carCategoryController.loadListMainMenu(parseInt($('#idCarCategory').val()));
                setTimeout(function () {
                    carCategoryController.getDisplayOrder(parseInt($('#selectCarCategoryChild').val()), 0, "none");
                },200);
                $('#selectCarCategoryChild').prop('hidden', false);
            }
        });
        $('#selectCarCategoryChild').off('click').on('change', function () {
            carCategoryController.getDisplayOrder(parseInt($('#selectCarCategoryChild').val()), 0,"none");
        });
        $('#minusCarCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectCarCategory').val()) == 0 ? 0 : parseInt($('#selectCarCategoryChild').val());
            carCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderCarCategory').val()), "minus");
        });
        $('#plusCarCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectCarCategory').val()) == 0 ? 0 : parseInt($('#selectCarCategoryChild').val());
            carCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderCarCategory').val()), "plus");
        });
        $('#btnAddCarCategory').off('click').on('click', function () {
            carCategoryController.resetForm();
            $('#createEditCarCategory').html("Thêm Mới");
        });
        $('#createEditCarCategory').off('click').on('click', function () {
            if ($('#nameCarCategory').val() != "" && $('#metaKeywordsCarCategory').val() != "" && $('#metaDescriptionsCarCategory').val() != "" && $('#titleCarCategory').val() != "") {
                carCategoryController.createEditCarCategory();
            }
            else {
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
            }
        });
        $('.btn-edit-carcategory').off('click').on('click', function () {
            $('#createEditCarCategory').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            carCategoryController.loadCarCategoryDetail(id);
        });
        $('.btn-delete-carcategory').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?")) {
                carCategoryController.deleteCarCategory(id);
                carCategoryController.resetForm();
            }
                
        });
        $('.btn-stt-carcategory').off('click').on('click', function () {
            var id = $(this).data('id');
            var btn = $(this);
            carCategoryController.changeStatus(id, btn);
        });
    },
    loadListMainMenu: function (id) {
        $.ajax({
            url: '/Admin/CarCategory/GetListMainMenu',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#selectCarCategoryChild').html('');
                $.each(response.data, function (i, item) {
                    $('#selectCarCategoryChild').append($('<option>', { value: item.ID, text: item.Name }));
                })
            },
        })
    },
    loadCarCategory: function(){
        $.ajax({
            url: '/Admin/CarCategory/LoadCarCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = "";
                var htmlChild = "";
                var CarCategoryData = $('#carCategory-data').html();
                $.each(response.data, function (i, item) {
                    html += Mustache.render(CarCategoryData, {
                        ID: item.ID,
                        Name: item.Name,
                        DisplayOrder: item.DisplayOrder,
                        CarCategoryChild: carCategoryController.readData(item.CategoryChild,item.DisplayOrder),
                        Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                    });
                });
                $('#listCarCaterogy').html(html);
                carCategoryController.registerEvents();
            },
        })
    },
    readData: function (data, displayParent) {
        var html = "";
        $.each(data, function (i, item) {
            var strStatus = item.Status == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>";
            html += "<div class='line-menu pull-left'>"
                     + "<div class='pull-left'><strong>" + displayParent + "." + item.DisplayOrder + "</strong></div>"
                     + "<div class='pull-left'><strong>" + item.Name + " </strong></div>"
                     + "<div class='pull-right btn-stt-carcategory' data-id='" + item.Id + "'>" + strStatus + "</div>"
                     + "</div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-info btn-edit-carcategory' title='Sửa'><i class='fa fa-edit'></i></div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-danger btn-delete-carcategory' title='Xoá'><i class='ti-trash'></i></div>"
                     + "<div class='menu-child'></div>";
        });
        return html;
    },
    createEditCarCategory: function () {
        var id = parseInt($('#idCarCategory').val());
        var name = $('#nameCarCategory').val();
        var parentID = parseInt($('#selectCarCategory').val()) == 0 ? 0 : parseInt($('#selectCarCategoryChild').val());
        var displayOrder = parseInt($('#displayOrderCarCategory').val());
        var metaKeywords = $('#metaKeywordsCarCategory').val();
        var metaDescript = $('#metaDescriptionsCarCategory').val();
        var seoTitle = $('#titleCarCategory').val();
        var stt = $('#statusCarCategory').prop("checked");
        var CarCategory = {
            ID: id,
            Name: name,
            ParentID: parentID,
            DisplayOrder: displayOrder,
            SeoTitle: seoTitle,
            MetaKeywords: metaKeywords,
            MetaDescriptions: metaDescript,
            Status: stt
        };
        $.ajax({
            url: '/Admin/CarCategory/CreateEditCarCategory',
            data: {
                strCarCategory: JSON.stringify(CarCategory)
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.result == 1) {
                    toastr.success("Thêm danh mục xe ôtô thành công!", "Success");
                    carCategoryController.loadCarCategory();
                    setTimeout(function () {
                        carCategoryController.resetForm();
                    }, 200);
                }
                else if (response.result == 2) {
                    toastr.success("Chỉnh sửa danh mục xe ôtô thành công!", "Success");
                    carCategoryController.loadCarCategory();
                    setTimeout(function () {
                        carCategoryController.resetForm();
                    }, 200);
                }
                else {
                    var str = id == 0 ? "Thêm danh mục xe ôtô không thành công!" : "Chỉnh sửa danh mục xe ôtô không thành công!"
                    toastr.error(str, "Error");
                }
            }
        })
    },
    loadCarCategoryDetail: function (Id) {
        $.ajax({
            url: '/Admin/CarCategory/LoadCarCategoryDetail',
            data: {
                Id: Id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idCarCategory').val(data.ID);
                $('#nameCarCategory').val(data.Name);
                if (data.ParentID != 0) {
                    $('#selectCarCategory').val(1);
                    carCategoryController.loadListMainMenu(data.ID);
                    $('#selectCarCategoryChild').prop('hidden', false);
                    setTimeout(function () {
                        $('#selectCarCategoryChild').val(data.ParentID);
                        $('#displayOrderCarCategory').val(data.DisplayOrder);
                    }, 100);
                }
                if (data.ParentID == 0) {
                    $('#selectCarCategory').val(0);
                    $('#displayOrderCarCategory').val(data.DisplayOrder);
                    $('#selectCarCategoryChild').prop('hidden', true);
                }
                $('#metaKeywordsCarCategory').val(data.MetaKeywords);
                $('#metaDescriptionsCarCategory').val(data.MetaDescriptions);
                $('#titleCarCategory').val(data.SeoTitle);
                $('#statusCarCategory').prop("checked",data.Status);
            }
        })
    },
    deleteCarCategory: function(Id){
        $.ajax({
            url: '/Admin/CarCategory/DeleteCarCategory',
            data: {
                Id: Id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá danh mục xe ôtô thành công!", "Success");
                    carCategoryController.loadCarCategory();
                }
                else if (response.res == 2) {
                    toastr.warning("Còn ÔTô Tồn Tại Trong Danh Mục Này!", "Warning");
                }
                else {
                    toastr.error("Xoá danh mục xe ôtô không thành công!", "Fail");
                }
            },
        });
    },
    changeStatus: function (Id,btn) {
        $.ajax({
            url: '/Admin/CarCategory/ChangeStatus',
            data: { Id: Id },
            type: 'POST',
            dataTyp: 'json',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                btn.html(html);
            }
        });
    },
    getDisplayOrder: function (parentId,display,cal) {
        $.ajax({
            url: '/Admin/CarCategory/GetDisplayOrder',
            data: {
                parentId: parentId,
                display: display,
                cal: cal
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.res != 0) $('#displayOrderCarCategory').val(response.res);
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
        $('#idCarCategory').val(0);
        $('#nameCarCategory').val("");
        $('#selectCarCategory').val(0);
        carCategoryController.getDisplayOrder(0, 0, "none");
        $('#selectCarCategoryChild').prop('hidden', true);
        $('#metaKeywordsCarCategory').val("");
        $('#metaDescriptionsCarCategory').val("");
        $('#titleCarCategory').val("");
        $('#createEditCarCategory').html("Thêm Mới");
    },
}
carCategoryController.init();