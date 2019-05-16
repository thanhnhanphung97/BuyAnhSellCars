categoryConfig = {
     
}

var carpartCategoryController = {
    init: function () {
        carpartCategoryController.getDisplayOrder(0, 0, "none");
        setTimeout(function () {
            carpartCategoryController.loadCarPartCategory();
        }, 200);
        carpartCategoryController.setFormatToastr();
        carpartCategoryController.registerEvents();
    },
    registerEvents: function () {
        $('#selectCarPartCategory').off('click').on('change', function () {
            if (parseInt($('#selectCarPartCategory').val()) == 0) {
                carpartCategoryController.getDisplayOrder(0, 0, "none");
                $('#selectCarPartCategoryChild').prop('hidden', true);
            }
            else {
                carpartCategoryController.loadListMainMenu(parseInt($('#idCarPartCategory').val()));
                setTimeout(function () {
                    carpartCategoryController.getDisplayOrder(parseInt($('#selectCarPartCategoryChild').val()), 0, "none");
                },200);
                $('#selectCarPartCategoryChild').prop('hidden', false);
            }
        });
        $('#selectCarPartCategoryChild').off('click').on('change', function () {
            carpartCategoryController.getDisplayOrder(parseInt($('#selectCarPartCategoryChild').val()), 0,"none");
        });
        $('#minusCarPartCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectCarPartCategory').val()) == 0 ? 0 : parseInt($('#selectCarPartCategoryChild').val());
            carpartCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderCarPartCategory').val()), "minus");
        });
        $('#plusCarPartCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectCarPartCategory').val()) == 0 ? 0 : parseInt($('#selectCarPartCategoryChild').val());
            carpartCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderCarPartCategory').val()), "plus");
        });
        $('#btnAddCarPartCategory').off('click').on('click', function () {
            carpartCategoryController.resetForm();
            $('#createEditCarPartCategory').html("Thêm Mới");
        });
        $('#createEditCarPartCategory').off('click').on('click', function () {
            if ($('#nameCarPartCategory').val() != "" && $('#metaKeywordsCarPartCategory').val() != "" && $('#metaDescriptionsCarPartCategory').val() != "" && $('#titleCarPartCategory').val() != "") {
                carpartCategoryController.createEditCarPartCategory();
            }
            else {
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
            }
        });
        $('.btn-edit-carpartcategory').off('click').on('click', function () {
            $('#createEditCarPartCategory').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            carpartCategoryController.loadCarPartCategoryDetail(id);
        });
        $('.btn-delete-carpartcategory').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?")) {
                carpartCategoryController.deleteCarPartCategory(id);
                carpartCategoryController.resetForm();
            }
                
        });
        $('.btn-stt-carpartcategory').off('click').on('click', function () {
            var id = $(this).data('id');
            var btn = $(this);
            carpartCategoryController.changeStatus(id, btn);
        });
    },
    loadListMainMenu: function (id) {
        $.ajax({
            url: '/Admin/CarPartCategory/GetListMainMenu',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#selectCarPartCategoryChild').html('');
                $.each(response.data, function (i, item) {
                    $('#selectCarPartCategoryChild').append($('<option>', { value: item.ID, text: item.Name }));
                })
            },
        })
    },
    loadCarPartCategory: function(){
        $.ajax({
            url: '/Admin/CarPartCategory/LoadCarPartCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = "";
                var htmlChild = "";
                var CarPartCategoryData = $('#carpartCategory-data').html();
                $.each(response.data, function (i, item) {
                    html += Mustache.render(CarPartCategoryData, {
                        ID: item.ID,
                        Name: item.Name,
                        DisplayOrder: item.DisplayOrder,
                        CarPartCategoryChild: carpartCategoryController.readData(item.CategoryChild,item.DisplayOrder),
                        Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                    });
                });
                $('#listCarPartCaterogy').html(html);
                carpartCategoryController.registerEvents();
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
                     + "<div class='pull-right btn-stt-carpartcategory' data-id='" + item.Id + "'>" + strStatus + "</div>"
                     + "</div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-info btn-edit-carpartcategory' title='Sửa'><i class='fa fa-edit'></i></div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-danger btn-delete-carpartcategory' title='Xoá'><i class='ti-trash'></i></div>"
                     + "<div class='menu-child'></div>";
        });
        return html;
    },
    createEditCarPartCategory: function () {
        var id = parseInt($('#idCarPartCategory').val());
        var name = $('#nameCarPartCategory').val();
        var parentID = parseInt($('#selectCarPartCategory').val()) == 0 ? 0 : parseInt($('#selectCarPartCategoryChild').val());
        var displayOrder = parseInt($('#displayOrderCarPartCategory').val());
        var metaKeywords = $('#metaKeywordsCarPartCategory').val();
        var metaDescript = $('#metaDescriptionsCarPartCategory').val();
        var seoTitle = $('#titleCarPartCategory').val();
        var stt = $('#statusCarPartCategory').prop("checked");
        var CarPartCategory = {
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
            url: '/Admin/CarPartCategory/CreateEditCarPartCategory',
            data: {
                strCarPartCategory: JSON.stringify(CarPartCategory)
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.result == 1) {
                    toastr.success("Thêm danh mục phụ tùng thành công!", "Success");
                    carpartCategoryController.loadCarPartCategory();
                    setTimeout(function () {
                        carpartCategoryController.resetForm();
                    }, 200);
                }
                else if (response.result == 2) {
                    toastr.success("Chỉnh sửa danh mục phụ tùng thành công!", "Success");
                    carpartCategoryController.loadCarPartCategory();
                    setTimeout(function () {
                        carpartCategoryController.resetForm();
                    }, 200);
                }
                else {
                    var str = id == 0 ? "Thêm danh mục phụ tùng không thành công!" : "Chỉnh sửa danh mục phụ tùng không thành công!"
                    toastr.error(str, "Error");
                }
            }
        })
    },
    loadCarPartCategoryDetail: function (Id) {
        $.ajax({
            url: '/Admin/CarPartCategory/LoadCarPartCategoryDetail',
            data: {
                Id: Id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idCarPartCategory').val(data.ID);
                $('#nameCarPartCategory').val(data.Name);
                if (data.ParentID != 0) {
                    $('#selectCarPartCategory').val(1);
                    carpartCategoryController.loadListMainMenu(data.ID);
                    $('#selectCarPartCategoryChild').prop('hidden', false);
                    setTimeout(function () {
                        $('#selectCarPartCategoryChild').val(data.ParentID);
                        $('#displayOrderCarPartCategory').val(data.DisplayOrder);
                    }, 100);
                }
                if (data.ParentID == 0) {
                    $('#selectCarPartCategory').val(0);
                    $('#displayOrderCarPartCategory').val(data.DisplayOrder);
                    $('#selectCarPartCategoryChild').prop('hidden', true);
                }
                $('#metaKeywordsCarPartCategory').val(data.MetaKeywords);
                $('#metaDescriptionsCarPartCategory').val(data.MetaDescriptions);
                $('#titleCarPartCategory').val(data.SeoTitle);
                $('#statusCarPartCategory').prop("checked",data.Status);
            }
        })
    },
    deleteCarPartCategory: function(Id){
        $.ajax({
            url: '/Admin/CarPartCategory/DeleteCarPartCategory',
            data: {
                Id: Id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá danh mục phụ tùng thành công!", "Success");
                    carpartCategoryController.loadCarPartCategory();
                }
                else if (response.res == 2) {
                    toastr.warning("Còn Phụ Tùng Tồn Tại Trong Danh Mục Này!", "Warning");
                }
                else {
                    toastr.error("Xoá danh mục phụ tùng không thành công!", "Error");
                }
            },
        });
    },
    changeStatus: function (Id,btn) {
        $.ajax({
            url: '/Admin/CarPartCategory/ChangeStatus',
            data: { Id: Id },
            type: 'POST',
            dataTyp: 'json',
            success: function (response) {
                if (response.used == false) {
                    var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                    btn.html(html);
                }
                else toastr.warning("Còn Phụ Tùng Tồn Tại Trong Danh Mục Này!", "Warning");
            }
        });
    },
    getDisplayOrder: function (parentId,display,cal) {
        $.ajax({
            url: '/Admin/CarPartCategory/GetDisplayOrder',
            data: {
                parentId: parentId,
                display: display,
                cal: cal
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.res != 0) $('#displayOrderCarPartCategory').val(response.res);
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
        $('#idCarPartCategory').val(0);
        $('#nameCarPartCategory').val("");
        $('#selectCarPartCategory').val(0);
        carpartCategoryController.getDisplayOrder(0, 0, "none");
        $('#selectCarPartCategoryChild').prop('hidden', true);
        $('#metaKeywordsCarPartCategory').val("");
        $('#metaDescriptionsCarPartCategory').val("");
        $('#titleCarPartCategory').val("");
        $('#createEditCarPartCategory').html("Thêm Mới");
    },
}