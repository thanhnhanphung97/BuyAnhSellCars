var contentconfig = {
    pageIndex: 1,
    pageSize: 7
}

var contentController = {
    init: function () {
        contentController.loadContent();
        contentController.registerEvent();
    },
    registerEvent: function () {
        $('#btnCreateContent').off('click').on('click', function () {
            $('#createEditContentModal').modal('show');
        })
    },
    loadContent: function () {
        $.ajax({
            url: '/Content/LoadListContent',
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
                        Status: item.Status == true ? "<i class='fa fa-check-square-o' aria-hidden='true'></i>" : "<i class='fa fa-square-o' aria-hidden='true'></i>"
                    });
                });
                $('#tblContent').html(html);
                contentController.pagingContent(response.totalRowContent, function () {
                    contentController.loadContent(contentconfig.pageIndex, contentconfig.pageSize);
                })
                contentController.registerEvent();
            }
        })
    },
    pagingContent: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / contentconfig.pageSize);
        totalPage = totalPage > 5 ? 5 : totalPage;
        $('#pagination-content').twbsPagination({
            totalPages: totalPage,
            visiblePages: totalPage,
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