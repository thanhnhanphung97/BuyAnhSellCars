var displayInfo = {
    init: function () {
        displayInfo.loadProfile();
        displayInfo.hiddenDataset();
        setTimeout(function () {
            displayInfo.displayDataset("homeadmin", $('ul li[data-id=homeadmin]'));
        }, 200);
        displayInfo.getDecent();
        $('ul.nav_menu').slicknav({
            prependTo: "#mobile_menu"
        });
        displayInfo.registerEvents();
    },
    registerEvents: function () {
        $('ul li').off('click').on('click', function () {
            var li = $(this);
            var id = $(this).data('id');
            displayInfo.displayDataset(id, li);
        });
        $('#profile-user').off('click').on('click', function (e) {
            e.preventDefault();
            displayInfo.displayDataset("profile-user", $(this));
        });
        $('#saveChangePassword').off('click').on('click', function () {
            if ($('#newpassword').val() != $('#repeatpassword').val()) toastr.warning("Nhập Lại Mật Khẩu Không Trùng Khớp Với Mật Khẩu Mới!", "Warning");
            else if ($('#oldpassword').val() != "" && $('#newpassword').val() != "" && $('#repeatpassword').val() != "") {
                displayInfo.saveChangePassword($('#newpassword').val());
            }
        });
        $('#logout').off('click').on('click',function(){
            displayInfo.logOut();
        });
    },
    hiddenDataset: function () {
        $.each($('.dataset_admin'), function (i, item) {
            $(this).prop('hidden', true);
        });
        $.each($('ul.metismenu li'), function (i, item) {
            $(this).removeClass();
        });
        $('#mobile_menu .slicknav_menu ul:eq(0)').css("display", "none");
    },
    displayDataset: function (id, li) {
        if (id == "homeadmin") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li ul.in'), function (i, item) {
                $(this).removeClass();
                $(this).addClass('collapse');
            });
            li.addClass('active');
            $('#homeadmin_dataset').prop('hidden', false);
        }
        if (id == "client") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "usermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            userconfig.typeAccount = 0;
            userController.loadUser(userconfig.pageIndex,userconfig.pageSize,userconfig.typeAccount);
            $('#user_dataset').prop('hidden', false);
        };
        if (id == "user") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "usermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            userconfig.typeAccount = 1;
            userController.loadUser(userconfig.pageIndex, userconfig.pageSize, userconfig.typeAccount);
            $('#user_dataset').prop('hidden', false);
        };
        if (id == "carpartcategory") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carpartmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#carpartcategory_dataset').prop('hidden', false);
        };
        if (id == "manufacturercarpart") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carpartmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#manufacturer_dataset').prop('hidden', false);
        };
        if (id == "origincarpart") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carpartmanagement") $(this).addClass('active');
            });
            originconfig.typeOrigin = 0;
            originController.loadOrigin(originconfig.pageIndex, originconfig.pageSize, originconfig.typeOrigin);
            li.addClass('active');
            $('#origin_dataset').prop('hidden', false);
        };
        if (id == "carpart") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carpartmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            originconfig.typeOrigin = 0;
            carpartController.loadListOrigin();
            $('#carpart_dataset').prop('hidden', false);
        };
        if (id == "carcategory") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#carcategory_dataset').prop('hidden', false);
        };
        if (id == "origincar") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            originconfig.typeOrigin = 1;
            originController.loadOrigin(originconfig.pageIndex, originconfig.pageSize, originconfig.typeOrigin);
            $('#origin_dataset').prop('hidden', false);
        };
        if (id == "salientscar") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#salients_dataset').prop('hidden', false);
        };
        if (id == "car") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "carmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            originconfig.typeOrigin = 1;
            carpartController.loadListOrigin();
            $('#car_dataset').prop('hidden', false);
        };
        if (id == "newscategory") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "newsmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#newscategory_dataset').prop('hidden', false);
        };
        if (id == "news") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "newsmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#news_dataset').prop('hidden', false);
        };
        if (id == "mainmenu") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "systemmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            $('#mainmenu_dataset').prop('hidden', false);
        };
        if (id == "profile-user") {
            displayInfo.hiddenDataset();
            $('#profile_dataset').prop('hidden', false);
        };
        if (id == "ordercancel") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "ordermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            orderconfig.status = 0;
            orderController.loadOrderByStatus(0, orderconfig.pageIndex, orderconfig.pageSize);
            $('#order_dataset').prop('hidden', false);
        };
        if (id == "orderprogressing") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "ordermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            orderconfig.status = 1;
            orderController.loadOrderByStatus(1, orderconfig.pageIndex, orderconfig.pageSize);
            $('#order_dataset').prop('hidden', false);
        };
        if (id == "orderdelevery") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "ordermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            orderconfig.status = 2;
            orderController.loadOrderByStatus(2, orderconfig.pageIndex, orderconfig.pageSize);
            $('#order_dataset').prop('hidden', false);
        };
        if (id == "orderdelivered") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "ordermanagement") $(this).addClass('active');
            });
            li.addClass('active');
            orderconfig.status = 3;
            orderController.loadOrderByStatus(3, orderconfig.pageIndex, orderconfig.pageSize);
            $('#order_dataset').prop('hidden', false);
        };
        if (id == "groupmanager") {
            displayInfo.hiddenDataset();
            $.each($('ul.metismenu li'), function (i, item) {
                if ($(item).data('id') == "systemmanagement") $(this).addClass('active');
            });
            li.addClass('active');
            groupManagerController.loadgroupManager(groupmanagerconfig.pageIndex, groupmanagerconfig.pageSize);
            $('#decentralization_dataset').prop('hidden', false);
        };
    },
    loadProfile: function () {
        $.ajax({
            url: '/Admin/User/GetUserByUN',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var strName = data.Name + "<i class='fa fa-angle-down'></i>";
                $('.user-name').html(strName);
                $('#profile-username').html(data.Name);
                //group-user
                $('#user-id').html(data.ID);
                $('#user-email').html(data.Email);
                $('#user-phone').html(data.Phone);
                $('#user-address').html(data.Address);
                $('#user-username').html(data.UserName);
            }
        })
    },
    saveChangePassword: function (newPass) {
        var id = parseInt($('#user-id').html().toString());
        $.ajax({
            url: '/Admin/User/ChangePassword',
            data: {
                Id: id,
                newPass: newPass,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thay Đổi Mật Khẩu Thành Công!","Success")
                }
                else toastr.warning("Thay Đổi Mật Khẩu Không Thành Công!", "Warning")
            }
        })
    },
    getDecent: function(){
        $.ajax({
            url: '/Admin/User/GetDecent',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if(data.UserManager == true) { 
                    userController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "usermanagement") $(this).html('');
                        $('#user_dataset').html('');
                    })
                }
                if (data.CarPartManager == true) {
                    carpartController.init();
                    carpartCategoryController.init();
                    originController.init();
                    manufacturerController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "carpartmanagement") $(this).html('');
                        $('#carpart_dataset').html('');
                        $('#carpartcategory_dataset').html('');
                        $('#manufacturer_dataset').html('');
                    })
                }
                if (data.CarManager == true) {
                    carController.init();
                    carCategoryController.init();
                    originController.init();
                    salientController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "carmanagement") $(this).html('');
                        $('#car_dataset').html('');
                        $('#carcategory_dataset').html('');
                        $('#salients_dataset').html('');
                    })
                }
                if (data.OrderManager == true) {
                    orderController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "ordermanagement") $(this).html('');
                        $('#order_dataset').html('');
                    })
                }
                if (data.NewsManager == true) {
                    newsCategoryController.init();
                    contentController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "newsmanagement") $(this).html('');
                        $('#newscategory_dataset').html('');
                        $('#news_dataset').html('');
                    })
                }
                if (data.SystemManager == true) {
                    homeCategoryController.init();
                    groupManagerController.init();
                }
                else {
                    $.each($('ul.metismenu li'), function (i, item) {
                        if ($(this).data('id') == "systemmanagement") $(this).html('');
                        $('#mainmenu_dataset').html('');
                        $('#decentralization_dataset').html('');
                    })
                }

            }
        })
    },
    logOut: function () {
        $.ajax({
            type: "POST",
            url: '/Admin/User/LogOutToLogin',
            data: {},
            dataType: "json",
            success: function (data) {
                location.href = "http://localhost:20455/Admin/Login";
            },
        });
    },
}

displayInfo.init();