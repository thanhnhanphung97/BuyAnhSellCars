categoryConfig = {
    pageIndex: 1,
    pageSize: 7 
}

var newsCategoryController = {
    init: function () {
        newsCategoryController.getDisplayOrder(0, 0, "none");
        setTimeout(function () {
            newsCategoryController.loadNewsCategory();
        }, 200);
        newsCategoryController.setFormatToastr();
        newsCategoryController.registerEvent();
    },
    registerEvent: function () {
        $('#selectNewsCategory').on('change', function () {
            if (parseInt($('#selectNewsCategory').val()) == 0) {
                newsCategoryController.getDisplayOrder(0, 0, "none");
                $('#selectNewsCategoryChild').prop('hidden', true);
            }
            else {
                newsCategoryController.loadListMainMenu();
                setTimeout(function () {
                    newsCategoryController.getDisplayOrder(parseInt($('#selectNewsCategoryChild').val()), 0, "none");
                },200);
                $('#selectNewsCategoryChild').prop('hidden', false);
            }
        });
        $('#selectNewsCategoryChild').on('change', function () {
            newsCategoryController.getDisplayOrder(parseInt($('#selectNewsCategoryChild').val()), 0,"none");
        });
        $('#minusNewsCategory').on('click', function () {
            var parentId = parseInt($('#selectNewsCategory').val()) == 0 ? 0 : parseInt($('#selectNewsCategoryChild').val());
            newsCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderNewsCategory').val()), "minus");
        });
        $('#plusNewsCategory').on('click', function () {
            var parentId = parseInt($('#selectNewsCategory').val()) == 0 ? 0 : parseInt($('#selectNewsCategoryChild').val());
            newsCategoryController.getDisplayOrder(parseInt(parentId), parseInt($('#displayOrderNewsCategory').val()), "plus");
        });
        $('#btnAddNewsCategory').on('click', function () {
            newsCategoryController.resetForm();
            $('#createEditNewsCategory').html("Thêm Mới");
        });
    },
    loadListMainMenu: function () {
        $.ajax({
            url: '/NewsCategory/GetListMainMenu',
            data: {},
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
            url: '/NewsCategory/LoadNewsCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = "";
                var htmlChild = "";
                var newsCategoryData = $('#newsCategory-data').html();
                $.each(response.data, function (i, items) {
                    html += Mustache.render(newsCategoryData, {
                        ID: items.ID,
                        Name: items.Name,
                        DisplayOrder: items.DisplayOrder,
                        NewsCategoryChild: newsCategoryController.readData(items.CategoryChild),
                        Status: items.Status
                    });
                });
                $('#listNewsCaterogy').html(html);
            },
        })
    },
    readData: function(data){
        var html = "";
        $.each(data,function(i, item){
            html += item.Id + " " + item.Name + " " + item.DisplayOrder + " " + item.Status;
        });
        return html;
    },
    getDisplayOrder: function (parentId,display,cal) {
        $.ajax({
            url: '/NewsCategory/GetDisplayOrder',
            data: {
                parentId: parentId,
                display: display,
                cal: cal
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.rel != 0) $('#displayOrderNewsCategory').val(response.rel);
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
        $('#metaKeywordsNewCategory').val("");
        $('#metaDescriptionsNewsCategory').val("");
        $('#titleNewsCategory').val("");
    },
}
newsCategoryController.init();