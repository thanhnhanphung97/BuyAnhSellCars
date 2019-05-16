var carconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var carController = {
    init: function () {
        carController.loadCar();
        carController.setFormatToastr();
        carController.registerEvents();
    },
    registerEvents: function () {
        $('#btnCreateCar').off('click').on('click', function () {
            $('#title-carpart').html("Thêm Mới ÔTô");
            $('#createEditCar').html("Thêm Mới");
            carController.loadCarCategory();
            setTimeout(function () { carController.loadListOrigin(); }, 200);
            carController.resetForm();
            setTimeout(function () { $('#createEditCarModal').modal('show'); }, 200);
        });
        $('#createEditCar').off('click').on('click', function () {
            if ($('#nameCar').val() != "" && $('#imageCar').val() != "" && $('#modelCar').val() != "" && $('#interiorcolorCar').val() != ""
                && $('#engineCar').val() != "" && $('#colorCar').val() != "" && $('#doorsCar').val() != "" && $('#metaKeywordsCar').val() != ""
                && $('#metaDescriptionsCar').val() != "" && $('#seotitleCar').val() != "") {
                    carController.createEditCar();
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('.btn-edit-car').off('click').on('click', function () {
            $('#title-car').html("Chỉnh Sửa Thông Tin ÔTô");
            $('#createEditCar').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            carController.loadCarCategory();
            setTimeout(function () { carController.loadListOrigin(); }, 200);
            setTimeout(function () { carController.loadCarById(id); }, 200);
            setTimeout(function () { $('#createEditCarModal').modal('show'); }, 200);
        });
        $('.btn-delete-car').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                carController.deleteCar($(this).data('id'));
        });
        $('.btn-status-car').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            carController.changeStatusCar(id, btn);
        });
        $('.btn-salients-car').off('click').on('click', function () {
            $('#hiddenCarID').val($(this).data('id'));
            carController.loadListSalient();
            setTimeout(function () { carController.getListSalients(parseInt($('#hiddenCarID').val())); }, 200);
        });
        $('.btn-images-car').off('click').on('click', function () {
            $('#hidCarID').val($(this).data('id'));
            $('#listImageCar').html('');
            setTimeout(function () { carController.getListImages(parseInt($('#hidCarID').val())); }, 200);
        });
        $('#selectListImage').off('click').on('click', function (e) {
            e.preventDefault();
            var finder = new CKFinder();
            finder.selectActionFunction = function (url) {
                var check = -1;
                if ($('#listImageCar').html() != "") {
                    $.each($('#listImageCar img'), function (i, item) {
                        if (check != 0) {
                            var src = $(item).prop('src');
                            check = src.indexOf(url) == -1 ? -1 : 0;
                        }
                    });
                }
                if(check !=0) $('#listImageCar').append('<div style="float:left;margin-top: 10px;height:100px!important;"><img src="' + url + '" width="100" style="max-height: 100px;" /><div class="btn btn-delImg" style="margin:-70px 0 0 -15px;"><i class="fa fa-times"></i></div></div>');
                $('.btn-delImg').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                })
            };
            finder.popup();
        });
        $('#saveListImage').off('click').on('click', function () {
            var images = [];
            $.each($('#listImageCar img'), function (i, item) {
                var image = $(item).prop('src');
                var indexStart = image.indexOf("/Data");
                var str = image.slice(indexStart);
                images.push(str);
            });
            carController.saveImages(images, parseInt($('#hidCarID').val()));
        });
        $('#saveSalient').off('click').on('click', function () {
            var salients = $('#selectSalient').val();
            carController.saveSalients(salients, parseInt($('#hiddenCarID').val()));
        });
    },
    loadListSalient: function () {
        $.ajax({
            url: '/Salient/LoadListSalient',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#selectSalient').html("");
                $.each(data, function (i, item) {
                    $('#selectSalient').append($('<option>', { value: item.Name, text: item.Name }));
                    $('#selectSalient').multiselect({
                        search: true,
                    });
                    setTimeout(function () { $('#selectSalient').multiselect('reload'); }, 200);
                });
            }
        })
    },
    loadCarCategory: function () {
        $.ajax({
            url: '/Admin/Car/LoadCarCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var category = response.category;
                $('#categoryIdCar').html("");
                $.each(category, function (i, item) {
                    $('#categoryIdCar').append($('<option>', { value: item.ID, text: item.Name }));
                });
            },
        });
    },
    loadListOrigin: function () {
        $.ajax({
            url: '/Origin/LoadListOrigin',
            data: {
                type: originconfig.typeOrigin,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#originIdCar').html("");
                $.each(data, function (i, item) {
                    $('#originIdCar').append($('<option>', { value: item.ID, text: item.Name }));
                });
            },
        });
    },
    loadCar: function () {
        $.ajax({
            url: '/Admin/Car/LoadCar',
            data: {
                page: carconfig.pageIndex,
                pageSize: carconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var category = response.category;
                    var carData = $('#car-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(carData, {
                            ID: item.ID,
                            Name: item.Name,
                            Category: category[i].Name,
                            Image: "<img src='" + item.Image + "' style='width: 70px; height: auto;' />",
                            Price: "<div style='display:inline-block;'>" + carController.moneyFormat(item.Price) + "<div style='text-decoration:underline;float:right;margin:-2px 0 0 2px;'> đ</div></div>",
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    });
                    $('#tblCar').html(html);
                    if (response.totalRowCar > 0) {
                        carController.pagingCar(response.totalRowCar, function () {
                            carController.loadCar(carconfig.pageIndex, carconfig.pageSize);
                        })
                    }
                    carController.registerEvents();
                };
            },
        });
    },
    loadCarById: function (id) {
        $.ajax({
            url: '/Admin/Car/GetCarById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idCar').val(data.ID);
                $('#nameCar').val(data.Name);
                $('#imageCar').val(data.Image);
                $('#priceCar').val(carController.moneyFormat(data.Price));
                $('#prepayCar').val(carController.moneyFormat(data.PrePay));
                $('#categoryIdCar').val(data.CategoryID);
                var sold = data.Sold == 0 ? "false" : "true";
                $('#soldCar').val(sold);
                $('#modelCar').val(data.Model);
                $('#interiorcolorCar').val(data.InteriorColor);
                $('#engineCar').val(data.Engine);
                $('#originIdCar').val(data.OriginID);
                $('#fuelCar').val(data.Fuel);
                $('#yearOfManuCar').val(data.YearOfManufacture);
                $('#gearCar').val(data.Gear);
                $('#seatsCar').val(data.Seats);
                $('#kmTraveledCar').val(data.KmTraveled);
                $('#driveSystemCar').val(data.DriveSystem);
                $('#colorCar').val(data.CarColor);
                $('#doorsCar').val(data.Doors);
                $('#metaKeywordsCar').val(data.MetaKeywords);
                $('#statusCar').prop('checked', data.Status);
                $('#seotitleCar').val(data.SeoTitle);
                $('#metaDescriptionsCar').val(data.MetaDescriptions);
            },
        })
    },
    createEditCar: function () {
        var id = $('#idCar').val();
        var name = $('#nameCar').val();
        var image = $('#imageCar').val();
        var price = parseInt(carController.numFormat($('#priceCar').val()));
        var prepay = parseInt(carController.numFormat($('#prepayCar').val()));
        var categoryID = $('#categoryIdCar').val();
        var sold = $('#soldCar').val() == "true" ? true : false;
        var model = $('#modelCar').val();
        var interior = $('#interiorcolorCar').val();
        var engine =  $('#engineCar').val();
        var originId = parseInt($('#originIdCar').val());
        var fuel = $('#fuelCar').val();
        var year = parseInt($('#yearOfManuCar').val());
        var gear = $('#gearCar').val();
        var seats = parseInt($('#seatsCar').val());
        var km = parseInt($('#kmTraveledCar').val());
        var system = $('#driveSystemCar').val();
        var color = $('#colorCar').val();
        var doors = parseInt($('#doorsCar').val());
        var metaKeyword = $('#metaKeywordsCar').val();
        var status = $('#statusCar').prop('checked');
        var seotitle = $('#seotitleCar').val();
        var metaDescript = $('#metaDescriptionsCar').val();
        var Car = {
            ID: id,
            Name: name,
            SeoTitle: seotitle,
            Image: image,
            Price: price,
            PrePay: prepay,
            CategoryID: categoryID,
            Sold: sold,
            Model: model,
            InteriorColor: interior,
            Engine: engine,
            OriginID: originId,
            Fuel: fuel,
            YearOfManufacture: year,
            Gear: gear,
            Seats: seats,
            KmTraveled: km,
            DriveSystem: system,
            CarColor: color,
            Doors: doors,
            MetaKeywords: metaKeyword,
            MetaDescriptions: metaDescript,
            Status: status,
        };
        $.ajax({
            url: '/Admin/Car/CreateEditCar',
            data: {
                strCar: JSON.stringify(Car),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm ÔTô thành công!", "Success");
                    carController.loadCar();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin ÔTô thành công!", "Success");
                    carController.loadCar();
                }
                else toastr.error("Thêm ÔTô không thành công!", "Error");
                $('#createEditCarModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditCarModal').modal('hide');
            }
        })
    },
    deleteCar: function (id) {
        $.ajax({
            url: '/Admin/Car/DeleteCar',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.mes) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    carController.loadCar();
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    changeStatusCar: function (id, btn) {
        $.ajax({
            url: '/Admin/Car/ChangeStatus',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                var html = response.res == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                btn.html(html);
            }
        })
    },
    resetForm: function () {
        $('#idCar').val(0);
        $('#nameCar').val('');
        $('#imageCar').val('');
        $('#priceCar').val(0);
        $('#prepayCar').val(0);
        $('#modelCar').val('');
        $('#interiorcolorCar').val('');
        $('#engineCar').val('');
        $('#yearOfManuCar').val('');
        $('#seatsCar').val(0);
        $('#kmTraveledCar').val(0);
        $('#colorCar').val('');
        $('#doorsCar').val(0);
        $('#metaKeywordsCar').val('');
        $('#statusCar').prop('checked', false);
        $('#seotitleCar').val('');
        $('#metaDescriptionsCar').val('');
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
    pagingCar: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / carconfig.pageSize);
        $('#pagination-car').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                carconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
    },
    moneyFormat: function (str) {
        str = parseFloat(str.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return str;
    },
    numFormat: function (str) {
        return str = str.toString().replace(/,/g, "");
    },
    saveImages: function (Images, id) {
        $.ajax({
            url: '/Admin/Car/SaveImages',
            data: {
                strImages: Images,
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) toastr.success("Lưu Danh Sách Hình Ảnh Thành Công!", "Success");
                else toastr.error("Lưu Danh Sách Hình Ảnh Không Thành Công!", "Error");
                $('#listImageModal').modal('hide');
            }
        });
    },
    saveSalients: function(Salients, id){
        $.ajax({
            url: '/Admin/Car/SaveSalients',
            data: {
                strSalients: Salients,
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) toastr.success("Lưu Danh Sách Tính Năng Thành Công!", "Success");
                else toastr.error("Lưu Danh Sách Tính Năng Không Thành Công!", "Error");
                $('#salienModal').modal('hide');
            }
        });
    },
    getListImages: function (id) {
        $.ajax({
            url: '/Admin/Car/GetListImages',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    $.each(data, function (i, item) {
                        if (i > 0) {
                            $('#listImageCar').append('<div style="float:left;margin-top: 10px;height:100px!important;"><img src="' + item + '" width="100" style="max-height: 100px;" /><div class="btn btn-delImg" style="margin:-70px 0 0 -15px;"><i class="fa fa-times"></i></div></div>');
                        }
                    });
                    $('.btn-delImg').off('click').on('click', function (e) {
                        e.preventDefault();
                        $(this).parent().remove();
                    });
                    $('#listImageModal').modal('show');
                }
                else {
                    $('#listImageModal').modal('show');
                }
            }
        });
    },
    getListSalients: function (id) {
        $.ajax({
            url: '/Admin/Car/GetListSalients',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    $.each(data, function (i, item) {
                        $('#selectSalient').multiselect('loadOptions', [{
                            name: item,
                            value: item,
                            checked: true,
                        }],false)
                    })
                    $('#salienModal').modal('show');
                }
                else {
                    $('#salienModal').modal('show');
                }
            }
        });
    },
}