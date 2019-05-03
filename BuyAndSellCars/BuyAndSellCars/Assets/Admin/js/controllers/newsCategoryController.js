categoryConfig = {
     
}

var newsCategoryController = {
    init: function () {
        newsCategoryController.getDisplayOrder(0, 0, "none");
        setTimeout(function () {
            newsCategoryController.loadNewsCategory();
        }, 200);
        newsCategoryController.setFormatToastr();
        newsCategoryController.registerEvents();
    },
    registerEvents: function () {
        $('#selectNewsCategory').off('click').on('change', function () {
            if (parseInt($('#selectNewsCategory').val()) == 0) {
                newsCategoryController.getDisplayOrder(0, 0, "none");
                $('#selectNewsCategoryChild').prop('hidden', true);
            }
            else {
                newsCategoryController.loadListMainMenu(parseInt($('#idNewsCategory').val()));
                setTimeout(function () {
                    newsCategoryController.getDisplayOrder(parseInt($('#selectNewsCategoryChild').val()), 0, "none");
                },200);
                $('#selectNewsCategoryChild').prop('hidden', false);
            }
        });
        $('#selectNewsCategoryChild').off('click').on('change', function () {
            newsCategoryController.getDisplayOrder(parseInt($('#selectNewsCategoryChild').val()), 0,"none");
        });
        $('#minusNewsCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectNewsCategory').val()) == 0 ? 0 : parseInt($('#selectNewsCategoryChild').val());
            newsCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderNewsCategory').val()), "minus");
        });
        $('#plusNewsCategory').off('click').on('click', function () {
            var parentId = parseInt($('#selectNewsCategory').val()) == 0 ? 0 : parseInt($('#selectNewsCategoryChild').val());
            newsCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderNewsCategory').val()), "plus");
        });
        $('#btnAddNewsCategory').off('click').on('click', function () {
            newsCategoryController.resetForm();
            $('#createEditNewsCategory').html("Thêm Mới");
        });
        $('#createEditNewsCategory').off('click').on('click', function () {
            if ($('#nameNewsCategory').val() != "" && $('#metaKeywordsNewsCategory').val() != "" && $('#metaDescriptionsNewsCategory').val() != "" && $('#titleNewsCategory').val() != "") {
                if (parseInt($('#selectNewsCategory').val()) != 0) {
                    if (parseInt($('#selectNewsCategoryChild').val()) != parseInt($('#displayOrderNewsCategory').val())) {
                        newsCategoryController.createEditNewsCategory();
                    }                        
                    else {
                        toastr.warning("Danh Mục Trên Không Thể Tự Làm Danh Mục Con Của Nó!", "Warning");
                    }
                }                
                else {
                    newsCategoryController.createEditNewsCategory();
                }
            }
            else {
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
            }
        });
        $('.btn-edit-newscategory').off('click').on('click', function () {
            $('#createEditNewsCategory').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            newsCategoryController.loadNewsCategoryDetail(id);
        });
        $('.btn-delete-newscategory').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?")) {
                newsCategoryController.deleteNewsCategory(id);
                newsCategoryController.resetForm();
            }
                
        });
        $('.btn-stt-newscategory').off('click').on('click', function () {
            var id = $(this).data('id');
            var btn = $(this);
            newsCategoryController.changeStatus(id, btn);
        });
    },
    loadListMainMenu: function (id) {
        $.ajax({
            url: '/Admin/NewsCategory/GetListMainMenu',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#selectNewsCategoryChild').html('');
                $.each(response.data, function (i, item) {
                    $('#selectNewsCategoryChild').append($('<option>', { value: item.ID, text: item.Name }));
                })
            },
        })
    },
    loadNewsCategory: function(){
        $.ajax({
            url: '/Admin/NewsCategory/LoadNewsCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var htmlChild = "";
                    var newsCategoryData = $('#newsCategory-data').html();
                    $.each(response.data, function (i, item) {
                        html += Mustache.render(newsCategoryData, {
                            ID: item.ID,
                            Name: item.Name,
                            DisplayOrder: item.DisplayOrder,
                            NewsCategoryChild: newsCategoryController.readData(item.CategoryChild, item.DisplayOrder),
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table' title='Kich hoạt'><i class='fa fa-unlock-alt' aria-hidden='true'></i></div>" : "<div class='btn btn-rounded btn-secondary btn-table' title='Khoá'><i class='fa fa-lock' aria-hidden='true'></i></div>"
                        });
                    });
                    $('#listNewsCaterogy').html(html);
                    newsCategoryController.registerEvents();
                }
                else {
                    $('#newsCategory-data').html("Không có dữ liệu!");
                }
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
                     + "<div class='pull-right btn-stt-newscategory' data-id='" + item.Id + "'>" + strStatus + "</div>"
                     + "</div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-info btn-edit-newscategory' title='Sửa'><i class='fa fa-edit'></i></div>"
                     + "<div data-id='" + item.Id + "' class='btn btn-xs btn-danger btn-delete-newscategory' title='Xoá'><i class='ti-trash'></i></div>"
                     + "<div class='menu-child'></div>";
        });
        return html;
    },
    createEditNewsCategory: function () {
        var id = parseInt($('#idNewsCategory').val());
        var name = $('#nameNewsCategory').val();
        var parentID = parseInt($('#selectNewsCategory').val()) == 0 ? 0 : parseInt($('#selectNewsCategoryChild').val());
        var displayOrder = parseInt($('#displayOrderNewsCategory').val());
        var metaKeywords = $('#metaKeywordsNewsCategory').val();
        var metaDescript = $('#metaDescriptionsNewsCategory').val();
        var seoTitle = $('#titleNewsCategory').val();
        var stt = $('#statusNewsCategory').prop("checked");
        var newsCategory = {
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
            url: '/Admin/NewsCategory/CreateEditNewsCategory',
            data: {
                strNewsCategory: JSON.stringify(newsCategory)
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.result == 1) {
                    toastr.success("Thêm danh mục tin tức thành công!", "Success");
                    newsCategoryController.loadNewsCategory();
                    setTimeout(function () {
                        newsCategoryController.resetForm();
                    }, 200);
                }
                else if (response.result == 2) {
                    toastr.success("Chỉnh sửa danh mục tin tức thành công!", "Success");
                    newsCategoryController.loadNewsCategory();
                    setTimeout(function () {
                        newsCategoryController.resetForm();
                    }, 200);
                }
                else {
                    var str = id == 0 ? "Thêm danh mục tin tức không thành công!" : "Chỉnh sửa danh mục tin tức không thành công!"
                    toastr.error(str, "Error");
                }
            }
        })
    },
    loadNewsCategoryDetail: function (Id) {
        $.ajax({
            url: '/Admin/NewsCategory/LoadNewsCategoryDetail',
            data: {
                Id: Id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idNewsCategory').val(data.ID);
                $('#nameNewsCategory').val(data.Name);
                if (data.ParentID != 0) {
                    $('#selectNewsCategory').val(1);
                    newsCategoryController.loadListMainMenu(data.ID);
                    $('#selectNewsCategoryChild').prop('hidden', false);
                    setTimeout(function () {
                        $('#selectNewsCategoryChild').val(data.ParentID);
                        $('#displayOrderNewsCategory').val(data.DisplayOrder);
                    }, 100);
                }
                if (data.ParentID == 0) {
                    $('#selectNewsCategory').val(0);
                    $('#displayOrderNewsCategory').val(data.DisplayOrder);
                    $('#selectNewsCategoryChild').prop('hidden', true);
                }
                $('#metaKeywordsNewsCategory').val(data.MetaKeywords);
                $('#metaDescriptionsNewsCategory').val(data.MetaDescriptions);
                $('#titleNewsCategory').val(data.SeoTitle);
                $('#statusNewsCategory').prop("checked",data.Status);
            }
        })
    },
    deleteNewsCategory: function(Id){
        $.ajax({
            url: '/Admin/NewsCategory/DeleteNewsCategory',
            data: {
                Id: Id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá danh mục tin tức thành công!", "Success");
                    newsCategoryController.loadNewsCategory();
                } 
                else if (response.res == 2) {
                    toastr.warning("Còn Tin Tức Tồn Tại Trong Danh Mục Này!", "Warning");
                }
                else {
                    toastr.error("Xoá danh mục tin tức không thành công!", "Error");
                }
            },
        });
    },
    changeStatus: function (Id,btn) {
        $.ajax({
            url: '/Admin/NewsCategory/ChangeStatus',
            data: { Id: Id },
            type: 'POST',
            dataTyp: 'json',
            success: function (response) {
                if (response.used == false) {
                    var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Kích Hoạt</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                    btn.html(html);
                }
                else toastr.warning("Còn Tin Tức Tồn Tại Trong Danh Mục Này!", "Warning");
            }
        });
    },
    getDisplayOrder: function (parentId,display,cal) {
        $.ajax({
            url: '/Admin/NewsCategory/GetDisplayOrder',
            data: {
                parentId: parentId,
                display: display,
                cal: cal
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.res != 0) $('#displayOrderNewsCategory').val(response.res);
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
        $('#idNewsCategory').val(0);
        $('#nameNewsCategory').val("");
        $('#selectNewsCategory').val(0);
        newsCategoryController.getDisplayOrder(0, 0, "none");
        $('#selectNewsCategoryChild').prop('hidden', true);
        $('#metaKeywordsNewsCategory').val("");
        $('#metaDescriptionsNewsCategory').val("");
        $('#titleNewsCategory').val("");
        $('#createEditNewsCategory').html("Thêm Mới");
    },
}
newsCategoryController.init();