var userconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var userController = {
    init: function () {
        userController.loadUser();
        userController.setFormatToastr();
        userController.registerEvents();
    },
    registerEvents: function () {
        $('#btnCreateUser').off('click').on('click', function () {
            userController.resetForm();
            $("#userName").prop('disabled', false);
            $('#passwordDefault').prop('hidden', false);
            $('#title-user').html("Thêm Mới Người Dùng");
            $('#createEditUser').html("Thêm");
            $('#createEditUserModal').modal('show');
        }),
        $('#createEditUser').off('click').on('click', function () {
            if ($('#mail').val() != "" && $('#userName').val() != "" && $('#name').val() != "" && $('#phone').val() != "" && $('#address').val() != "") {
                if (userController.validateEmail($('#mail').val()))
                    userController.createEditUser();
                else {
                    toastr.options.positionClass = 'toast-top-right';
                    toastr.warning("Email không đúng định dạng!", "Warning");
                    toastr.options.positionClass = 'toast-bottom-right';
                }
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        }),
        $('.btn-edit-user').off('click').on('click', function () {
            $('#title-user').html("Chỉnh Sửa Thông Tin Người Dùng");
            $("#userName").prop('disabled', true);
            $('#passwordDefault').prop('hidden', true);
            $('#createEditUser').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            userController.loadUserDetail(id);
            $('#createEditUserModal').modal('show');
        }),
        $('.btn-delete-user').off('click').on('click', function () {
            var id = $(this).data('id');
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                userController.deleteUser($(this).data('id'));
        }),
        $('.btn-status-user').off('click').on('click', function () {
            var btn = $(this);
            var Id = $(this).data('id');
            userController.changeStatus(Id,btn);
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
                    if (item.UserName != "admin") {
                        html += Mustache.render(userData, {
                            ID: item.ID,
                            UserName: item.UserName,
                            Name: item.Name,
                            Phone: item.Phone,
                            Email: item.Email,
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Kích hoạt</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    } 
                });
                $('#tblUser').html(html);
                userController.pagingUser(response.totalRowUser, function () {
                    userController.loadUser(userconfig.pageIndex, userconfig.pageSize);
                })
                userController.registerEvents();
            }
        })
    },
    pagingUser: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / userconfig.pageSize);
        $('#pagination-user').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
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
    createEditUser: function () {
        var id = parseInt($('#hidID').val());
        var userName = $('#userName').val();
        var name = $('#name').val();
        var phone = $('#phone').val();
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
            url: '/HomeAdmin/CreateEditUser',
            data: {
                strUser : JSON.stringify(user)
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.messenge == 1) toastr.success("Thêm user thành công!", "Success");
                else if (response.messenge == 2) toastr.success("Sửa thông tin thành công!", "Success");
                else toastr.error("Thêm user không thành công!", "Fail");
                $('#createEditUserModal').modal('hide');
                userController.loadUser();
            },
            error: function () {
                toastr.error("Thêm user không thành công!", "Error");
                $('#createEditUserModal').modal('hide');
            }
        })
    },
    loadUserDetail: function(id){
        $.ajax({
            url: '/HomeAdmin/LoadUserDetail',
            data: {
                Id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#hidID').val(data.ID);
                $('#userName').val(data.UserName);
                $('#name').val(data.Name);
                $('#phone').val(data.Phone);
                $('#address').val(data.Address);
                $('#mail').val(data.Email);
            }
        })
    },
    deleteUser: function(id){
        $.ajax({
            url: '/HomeAdmin/DeleteUser',
            data:{
                Id: id
            },
            dataType: 'json',
            type: 'POST',
            success: function(response){
                if (response.status == true) 
                {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    userController.loadUser(userconfig.pageIndex,userconfig.pageSize);
                }
                else toastr.error("Xoá bản ghi thất bại!", "Fail");
            }
        })
    },
    changeStatus: function(id,btn){
        $.ajax({
            url: '/HomeAdmin/ChangeStatus',
            data: {
                Id: id
            },
            dataType: 'json',
            type: 'POST',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Kích hoạt</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>";
                btn.html(html);
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
    },
    validateEmail: function (email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
};
userController.init();