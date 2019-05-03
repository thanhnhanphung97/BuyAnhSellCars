var contentconfig = {
    pageIndex: 1,
    pageSize: 10
}

var contentController = {
    init: function () {
        contentController.loadContent();
        contentController.setFormatToastr();
        contentController.registerEvents();
    },
    registerEvents: function () {    
        $('#btnCreateContent').off('click').on('click', function () {
            $('#title-content').html("Thêm Mới Tin Tức");
            $('#createEditContent').html("Thêm");
            contentController.resetFormContent();
            contentController.loadListNewsName();
            $('#createEditContentModal').modal('show');
        });
        $('#createEditContent').off('click').on('click', function () {
            if ($('#nameContent').val() != "" && $('#imageContent').val() != "" && $('#metaDescriptionContent').val() != "" && $('#metaKeywordsContent').val() != "" && $('#tags').val() != "" && CKEDITOR.instances.detailContent.getData() != "") {
                CKEDITOR.instances["detailContent"].updateElement();
                var detail = document.getElementById("detailContent").value;
                contentController.createEditContent(detail);
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-content').off('click').on('click', function () {
            $('#title-content').html("Chỉnh Sửa Thông Tin Tin Tức");
            $('#createEditContent').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            contentController.loadListNewsName();
            contentController.loadContentByID(id);
            $('#createEditContentModal').modal('show');
        });
        $('.btn-delete-content').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                contentController.deleteContent($(this).data('id'));
        });
        $('.btn-status-content').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            contentController.changeStatusContent(id, btn);
        });
    },
    loadContent: function () {
        $.ajax({
            url: '/Admin/Content/LoadListContent',
            type: 'GET',
            data: {
                page: contentconfig.pageIndex,
                pageSize: contentconfig.pageSize
            },
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = "";
                var contentData = $('#content-data').html();
                $.each(data, function (i, item) {
                    html += Mustache.render(contentData, {
                        ID: item.ID,
                        Name: item.Name,
                        CreatedBy: item.CreatedBy,
                        CategoryName: item.CategoryName,
                        ViewCount: item.ViewCount,
                        Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                    });
                });
                $('#tblContent').html(html);
                contentController.pagingContent(response.totalRowContent, function () {
                    contentController.loadContent(contentconfig.pageIndex, contentconfig.pageSize);
                })
                contentController.registerEvents();
            }
        })
    },
    createEditContent: function(detail){
        var id = parseInt($("#idContent").val());
        var name = $('#nameContent').val();
        var imgContent = $('#imageContent').val();
        var metaDes = $('#metaDescriptionContent').val();
        var metaKw = $('#metaKeywordsContent').val();
        var tags = $('#tags').val();
        var newsID = parseInt($('#selectCategoryID').val());
        var stt = $('#statusContent').prop("checked");
        var content = {
            ID: id,
            Name: name,
            Image: imgContent,
            Detail: detail,
            CategoryID: newsID,
            MetaDescriptions: metaDes,
            MetaKeywords: metaKw,
            Tags: tags,
            Status: stt
        };
        $.ajax({
            url: '/Admin/Content/CreateEditContent',
            data: {
                strContent: JSON.stringify(content)
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm tin tức thành công!", "Success");
                    contentController.loadContent();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin tin tức thành công!", "Success");
                    contentController.loadContent();
                }
                else toastr.error("Thêm tin tức không thành công!", "Error");
                $('#createEditContentModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditContentModal').modal('hide');
            }
        });
    },
    loadContentByID: function (id) {
        $.ajax({
            url: '/Admin/Content/GetContentByID',
            data: {
                Id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idContent').val(data.ID);
                $('#nameContent').val(data.Name);
                $('#imageContent').val(data.Image);
                CKEDITOR.instances["detailContent"].setData(data.Detail);
                $('#metaDescriptionContent').val(data.MetaDescriptions);
                $('#metaKeywordsContent').val(data.MetaKeywords);
                $('#tags').val(data.Tags);
                $('#selectCategoryID').val(data.CategoryID);
                $('#statusContent').prop("checked", data.Status);
            },
        })
    },
    deleteContent: function (id) {
        $.ajax({
            url: '/Admin/Content/DeleteContent',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.mes) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    contentController.loadContent();
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function(err) {
                toastr.error(err.error, "Error");
            }
        })
    },
    changeStatusContent: function (id, btn) {
        $.ajax({
            url: '/Admin/Content/ChangeStatus',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>";
                btn.html(html);
            }
        })
    },
    loadListNewsName: function () {
        $.ajax({
            url: "/NewsCategory/GetListNewsName",
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $("#selectCategoryID").html("");
                var data = response.data;
                $.each(data, function (i, item) {
                    $("#selectCategoryID").append($('<option>', { value: item.ID, text: item.Name }))
                });
            }
        });
    },
    resetFormContent: function () {
        $('#idContent').val('0');
        $('#nameContent').val("");
        $('#imageContent').val("");
        CKEDITOR.instances["detailContent"].setData("");
        $('#detailContent').val("");
        $('#metaDescriptionContent').val("");
        $('#metaKeywordsContent').val("");
        $('#tags').val("");
        $('#statusContent').prop("checked",false) ;
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
    pagingContent: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / contentconfig.pageSize);
        $('#pagination-content').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                contentconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
}

contentController.init();