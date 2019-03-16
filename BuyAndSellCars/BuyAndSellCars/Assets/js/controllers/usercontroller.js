var userconfig = {
    pageIndex: 1,
    pageSize: 5,
}

var userController = {
    init: function () {
        userController.registerEvent();
        userController.loadUser();
        userController.pagingUser();
    },
    registerEvent: function () {
        
    },
    loadUser: function () {
        $.ajax({
            url: '/HomeAdmin/LoadUserData',
            type: 'GET',
            data:{
                page: userconfig.pageIndex,
                pageSize: userconfig.pageSize
            },
            dataType: 'json',
            success: function (response) {
                
                var data = response.data;
                var html = "";
                var userData = $('#user-data').html();
                $.each(data, function (i, item) {
                    html += Mustache.render(userData, {
                        ID: item.ID,
                        UserName: item.UserName,
                        Name: item.Name,
                        Phone: item.Phone,
                        Email: item.Email,
                        Status: item.Status == true ? "<div id='" + item.ID + "'><i class='fa fa-check-square-o' aria-hidden='true'></i></div>" : "<div id='" + item.ID + "'><i class='fa fa-square-o' aria-hidden='true'></i></div>"
                        //Edit: "<i class='fa fa-pencil' aria-hidden='true'></i>",
                        //Delete: "<i class='fa fa-times' aria-hidden='true' style='color:red;'></i>"
                    });
                });
                $('#tblUser').html(html);
                userController.pagingUser(response.totalRowUser, function () {
                userController.loadUser();
                })
                userController.registerEvent();
            }
        })
    },
    pagingUser: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / userconfig.pageSize);
        $('#pagination-user').twbsPagination({
            totalPages: totalPage,
            visiblePages: totalPage > 5 ? 5 : totalPage,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                userconfig.pageIndex = page;
                setTimeout(callback, 200);
                //userController.loadUser();
            }
        });
    }
}
userController.init();