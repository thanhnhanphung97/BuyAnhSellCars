var userconfig = {
    pageIndex: 1,
    pageSize: 7,
}

var userController = {
    init: function () {
        userController.loadUser();
        userController.registerEvent();
        userController.setFormatToastr();
    },
    registerEvent: function () {
        $('#btnCreateUser').off('click').on('click', function () {
            userController.resetForm();
            $("#userName").prop('disabled', false);
            $('#title-user').html("Thêm Mới Người Dùng");
            $('#createEditUserModal').modal('show');
        }),
        $('#createEditUser').off('click').on('click', function () {
            if($('#mail').val() != "" && $('#userName').val() != "" && $('#name').val() != "" && $('#phone').val() != "" && $('#address').val() != "")
                userController.createEditUser();
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        }),
        $('.btn-edit-user').off('click').on('click', function () {
            $('#title-user').html("Chỉnh Sửa Thông Tin Người Dùng");
            $("#userName").prop('disabled', true);
            $('#passwordDefault').prop('hidden', true);
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
            var Id = $(this).data('id');
            userController.changeStatus(Id);
            setTimeout(userController.loadUser(), 200);
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
                        Status: item.Status == true ? "<i class='fa fa-check-square-o' aria-hidden='true'></i>" : "<i class='fa fa-square-o' aria-hidden='true'></i>"
                    });
                });
                $('#tblUser').html(html);
                userController.pagingUser(response.totalRowUser, function () {
                    userController.loadUser(userconfig.pageIndex, userconfig.pageSize);
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
    changeStatus: function(id){
        $.ajax({
            url: 'HomeAdmin/ChangeStatus',
            data: {
                Id: id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                var res = response.result;
                var html = res == true ? "<i class='fa fa-check-square-o' aria-hidden='true'></i>" : "<i class='fa fa-square-o' aria-hidden='true'></i>";
                $.data(id).html(html);
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