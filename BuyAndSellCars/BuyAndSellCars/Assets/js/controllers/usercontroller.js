var userconfig = {
    pageIndex: 1,
    pageSize: 7
}

var userController = {
    init: function () {
        userController.loadUser();
        userController.registerEvent();
        userController.setFormatToastr();
    },
    registerEvent: function () {
        $('#btnAddUser').off('click').on('click', function () {
            userController.resetForm();
            $('#title-user').html = "Thêm Mới Người Dùng";
            $('#addUpdateUserModel').modal('show');
        }),
        $('#createUpdateUser').off('click').on('click', function (e) {
            if($('#mail').val() != "" && $('#userName').val() != "" && $('#name').val() != "" && $('#phone').val() != "" && $('#address').val() != "")
                userController.createUpdateUser();
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        })
    },
    loadUser: function () {
        $.ajax({
            url: '/HomeAdmin/LoadUserData',
            type: 'GET',
            data: {
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
        totalPage = totalPage > 5 ? 5 : totalPage;
        $('#pagination-user').twbsPagination({
            totalPages: totalPage,
            visiblePages: totalPage,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                userconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
    createUpdateUser: function () {
        var id = parseInt($('#hidID').val());
        var userName = $('#userName').val();
        var name = $('#name').val();
        var phone = parseInt($('#phone').val());
        var address = $('#address').val();
        var mail = $('#mail').val();
        var user = {
            ID: id,
            UserName: userName,
            Password: "123",
            Name: name,
            Address: address,
            Phone: phone,
            Email: mail
        }
        $.ajax({
            url: '/HomeAdmin/CreateUpdateUser',
            data: {
                strUser : JSON.stringify(user)
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.messenge == 1) toastr.success("Thêm thành công!", "Success");
                else if (response.messenge == 2) toastr.success("Sửa thông tin thành công!", "Success");
                else toastr.error("Thêm user không thành công!", "Fail");
                $('#addUpdateUserModel').modal('hide');
                userController.loadUser();
            },
            error: function () {
                toastr.error("Thêm user không thành công!", "Error");
                $('#addUpdateUserModel').modal('hide');
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
        $('#hidID').val('0');
        $('#userName').val('');
        $('#name').val('');
        $('#phone').val('');
        $('#address').val('');
        $('#mail').val('');
    }
};
userController.init();