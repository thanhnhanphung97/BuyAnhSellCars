var groupmanagerconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var groupManagerController = {
    init: function () {
        groupManagerController.loadgroupManager();
        groupManagerController.setFormatToastr();
        groupManagerController.registerEvents();
    },
    registerEvents: function () {
        $('#btnCreateGroupManager').off('click').on('click', function () {
            $('#title-grpmanager').html("Thêm Mới Nhóm Quyền");
            $('#createEditGrpManager').html("Thêm Mới");
            groupManagerController.resetForm();
            $('#createEditGroupManagerModal').modal('show');
        });
        $('#createEditGrpManager').off('click').on('click', function () {
            if ($('#namegrpmanager').val() != "" && $('#descriptionGrpManager').val() != "") {
                groupManagerController.createEditGroupManager();
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-grpmanager').off('click').on('click', function () {
            $('#title-grpmanager').html("Chỉnh Sửa Thông Tin Nhóm Quyền");
            $('#createEditGrpManager').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            groupManagerController.loadGroupMemberById(id);
            $('#createEditGroupManagerModal').modal('show');
        });
        $('.btn-delete-grpmanager').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                groupManagerController.deleteGroupManager($(this).data('id'));
        });
        $('.btn-decen-grpmanager').off('click').on('click', function () {
            groupManagerController.getDecentByDecenID(parseInt($(this).data('id')));
        });
        $('#btnSaveDecent').off('click').on('click', function () {
            groupManagerController.saveDecent();
        });
    },
    loadgroupManager: function () {
        $.ajax({
            url: '/Admin/GroupManager/LoadListMemberGroup',
            data: {
                page: groupmanagerconfig.pageIndex,
                pageSize: groupmanagerconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var membergroupData = $('#grpmanager-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(membergroupData, {
                            ID: item.ID,
                            Name: item.Name,
                            Description: item.Description,
                            DecenID: item.DecenID,
                        });
                    });
                    $('#tblGroupManager').html(html);
                    if (response.totalRowMemberGroup > 0) {
                        groupManagerController.pagingGroupManager(response.totalRowMemberGroup, function () {
                            groupManagerController.loadgroupManager(groupmanagerconfig.pageIndex, groupmanagerconfig.pageSize);
                        })
                    }
                    groupManagerController.registerEvents();
                };
            },
        });
    },
    loadGroupMemberById: function (id) {
        $.ajax({
            url: '/Admin/GroupManager/GetMemberGroupById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#hidIdGrpManager').val(data.ID);
                $('#namegrpmanager').val(data.Name);
                $('#descriptionGrpManager').val(data.Description);
            },
        })
    },
    createEditGroupManager: function () {
        var id = $('#hidIdGrpManager').val();
        var name = $('#namegrpmanager').val();
        var description = $('#descriptionGrpManager').val();
        var MemberGroup = {
            ID: id,
            Name: name,
            Description: description,
        };
        $.ajax({
            url: '/Admin/GroupManager/CreateEditGroupMember',
            data: {
                strGrpMember: JSON.stringify(MemberGroup),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm nhóm quyền thành công!", "Success");
                    groupManagerController.loadgroupManager();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin nhóm quyền thành công!", "Success");
                    groupManagerController.loadgroupManager();
                }
                else toastr.error("Thêm nhóm quyền không thành công!", "Error");
                $('#createEditGroupManagerModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditGroupManagerModal').modal('hide');
            }
        })
    },
    deleteGroupManager: function (id) {
        $.ajax({
            url: '/Admin/GroupManager/DeleteMemberGroup',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    groupManagerController.loadgroupManager();
                }
                else if (response.res == 2) {
                    toastr.warning("Bản ghi này đang được sử dụng trong danh sách người dùng!", "Warning");
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    getDecentByDecenID: function(id){
        $.ajax({
            url: '/Admin/GroupManager/GetDecent',
            data: {Id : id,},
            type: 'GET',
            datType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idDecent').val(data.ID);
                $('#userManager').prop('checked', data.UserManager);
                $('#carpartManager').prop('checked', data.CarPartManager);
                $('#carManager').prop('checked', data.CarManager);
                $('#orderManager').prop('checked', data.OrderManager);
                $('#newsManager').prop('checked', data.NewsManager);
                $('#systemManager').prop('checked', data.SystemManager);

                $('#managerDecentralizationModal').modal('show');
            }
        })
    },
    saveDecent: function () {
        var decentId = $('#idDecent').val();
        var user = $('#userManager').prop('checked');
        var carpart = $('#carpartManager').prop('checked');
        var car = $('#carManager').prop('checked');
        var order = $('#orderManager').prop('checked');
        var news = $('#newsManager').prop('checked');
        var system = $('#systemManager').prop('checked');
        var Decent = {
            ID: decentId,
            UserManager: user,
            CarPartManager: carpart,
            CarManager: car,
            OrderManager: order,
            NewsManager: news,
            SystemManager: system,
        }
        $.ajax({
            url: '/Admin/GroupManager/SaveDecent',
            data: { strDecent: JSON.stringify(Decent), },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == true) {
                    toastr.success("phân quyền quản lý thành công!", "success");
                }
                else {
                    toastr.error("error", "error");
                }
                $('#managerDecentralizationModal').modal('hide');
            }
        });
    },
    resetForm: function () {
        $('#hidIdGrpManager').val(0);
        $('#namegrpmanager').val('');
        $('#descriptionGrpManager').val('');
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
    pagingGroupManager: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / groupmanagerconfig.pageSize);
        $('#pagination-grpmanager').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                groupmanagerconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
}