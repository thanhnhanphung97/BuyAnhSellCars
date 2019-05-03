carpartconfig = {
    pageIndex: 1,
    pageSize: 10,
}

var carpartController = {
    init: function () {
        carpartController.loadCarPart();
        carpartController.loadCarPartCategory();
        carpartController.loadListManufacturer();
        carpartController.loadListOrigin();
        carpartController.setFormatToastr();
        carpartController.registerEvents();
    },
    registerEvents: function () {
        $('#btnCreateCarPart').off('click').on('click', function () {
            $('#title-carpart').html("Thêm Mới Phụ Tùng");
            $('#createEditCarPart').html("Thêm Mới");
            carpartController.loadCarPartCategory();
            setTimeout(function () { carpartController.loadListOrigin(); }, 200);
            setTimeout(function () { carpartController.loadListManufacturer(); }, 200);
            carpartController.resetForm();
            setTimeout(function () { $('#createEditCarPartModal').modal('show'); }, 200);
        });
        $('#createEditCarPart').off('click').on('click', function () {
            if ($('#nameCarPart').val() != "" && $('#imageCarpart').val() != "" && CKEDITOR.instances.descriptionCarPart.getData() != "" && $('#codeCarPart').val() != "" && $('#metaKeywordsCarPart').val() != "" && $('#metaDescriptionsCarPart').val() != "" && $('#seotitleCarPart').val() != "") {
                CKEDITOR.instances["descriptionCarPart"].updateElement();
                var descript = document.getElementById("descriptionCarPart").value;
                carpartController.createEditCarPart(descript);
            }
            else {
                toastr.options.positionClass = 'toast-top-right';
                toastr.warning("Vui lòng nhập đầy đủ thông tin!", "Warning");
                toastr.options.positionClass = 'toast-bottom-right';
            }
        });
        $('#promotionChecked').on('click', function () {
            if ($('#promotionChecked').prop('checked') == true) $('.input-number-carpart').prop('hidden', false);
            else $('.input-number-carpart').prop('hidden', true);
        });
        $('.btn-edit-carpart').off('click').on('click', function () {
            $('#title-carpart').html("Chỉnh Sửa Thông Tin Phụ Tùng");
            $('#createEditCarPart').html("Lưu Thay Đổi");
            var id = $(this).data('id');
            //carpartController.loadCarPartCategory();
            //carpartController.loadListManufacturer();
            //carpartController.loadListOrigin();
            setTimeout(function () { carpartController.loadCarPartById(id); }, 200);
        });
        $('.btn-delete-carpart').off('click').on('click', function () {
            if (confirm("Bạn có muốn xoá bản ghi này?"))
                carpartController.deleteCarPart($(this).data('id'));
        });
        $('.btn-status-carpart').off('click').on('click', function () {
            var btn = $(this);
            var id = $(this).data('id');
            carpartController.changeStatusCarPart(id, btn);
        });
    },
    loadCarPartCategory: function () {
        $.ajax({
            url: '/Admin/CarPart/LoadCarPartCategory',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var category = response.category;
                $('#categoryIdCarPart').html("");
                $.each(category, function (i, item) {
                    $('#categoryIdCarPart').append($('<option>', { value: item.ID, text: item.Name }));
                });
            },
        });
    },
    loadListManufacturer: function () {
        $.ajax({
            url: '/Admin/Manufacturer/LoadListManufacturer',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#manufacturerIdCarPart').html("");
                $.each(data, function (i, item) {
                    $('#manufacturerIdCarPart').append($('<option>', { value: item.ID, text: item.Name }));
                });
            },
        });
    },
    loadListOrigin: function () {
        $.ajax({
            url: '/Admin/Origin/LoadListOrigin',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#originIdCarPart').html("");
                $.each(data, function (i, item) {
                    $('#originIdCarPart').append($('<option>', { value: item.ID, text: item.Name }));
                });
            },
        });
    },
    loadCarPart: function () {
        $.ajax({
            url: '/Admin/CarPart/LoadCarPart',
            data: {
                page: carpartconfig.pageIndex,
                pageSize: carpartconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (data != null) {
                    var html = "";
                    var category = response.category;
                    var carpartData = $('#carpart-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(carpartData, {
                            ID: item.ID,
                            Code: item.Code,
                            Category: category[i].Name,
                            Name: item.Name,
                            Image: "<img src='" + item.Image + "' style='width: 70px; height: auto;' />",
                            Price: "<div style='display:inline-block;'>" + carpartController.moneyFormat(item.Price) + "<div style='text-decoration:underline;float:right;margin:-2px 0 0 2px;'> đ</div></div>",
                            Quantity: item.Quantity,
                            Status: item.Status == true ? "<div class='btn btn-rounded btn-success btn-table'><i class='fa fa-unlock-alt' aria-hidden='true'> Hiển Thị</i></div>" : "<div class='btn btn-rounded btn-secondary btn-table'><i class='fa fa-lock' aria-hidden='true'> Khoá</i></div>"
                        });
                    });
                    $('#tblCarPart').html(html);
                    if (response.totalRowCarPart > 0) {
                        carpartController.pagingCarPart(response.totalRowCarPart, function () {
                            carpartController.loadCarPart(carpartconfig.pageIndex, carpartconfig.pageSize);
                        })
                    }
                    carpartController.registerEvents();
                };
            },
        });
    },
    loadCarPartById: function (id) {
        $.ajax({
            url: '/Admin/CarPart/GetCarPartById',
            data: {
                Id: id,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                $('#idCarPart').val(data.ID);
                $('#nameCarPart').val(data.Name);
                $('#imageCarpart').val(data.Image);
                CKEDITOR.instances["descriptionCarPart"].setData(data.Description);
                $('#descriptionCarPart').val(data.Description);
                $('#codeCarPart').val(data.Code);
                $('#priceCarPart').val(carpartController.moneyFormat(data.Price));
                $('#warrantyCarPart').val(data.Warranty);
                $('#originIdCarPart').val(data.OriginID);
                $('#manufacturerIdCarPart').val(parseInt(data.ManufacturerID));
                $('#quantityCarPart').val(data.Quantity);
                $('#metaKeywordsCarPart').val(data.MetaKeywords);
                $('#statusCarPart').prop('checked', data.Status);
                $('#seotitleCarPart').val(data.SeoTitle);
                $('#metaDescriptionsCarPart').val(data.MetaDescriptions);
                $('#categoryIdCarPart').val(data.CategoryID);
                if (data.PromotionPrice != -1) {
                    $('#promotionChecked').prop('checked', true);
                    $('.input-number-carpart').prop('hidden', false);
                    $('#promotionPrice').val(carpartController.moneyFormat(data.PromotionPrice));
                }
                else {
                    $('#promotionChecked').prop('checked', false);
                    $('.input-number-carpart').prop('hidden', true);
                    $('#promotionPrice').val(0);
                }
                $('#createEditCarPartModal').modal('show');
            },
        })
    },
    createEditCarPart: function (descript) {
        var id = $('#idCarPart').val();
        var name = $('#nameCarPart').val();
        var image = $('#imageCarpart').val();
        var code = $('#codeCarPart').val();
        var price = parseInt(carpartController.numFormat($('#priceCarPart').val()));
        var promotion = $('#promotionChecked').prop('checked') == true ? parseInt(carpartController.numFormat($('#promotionPrice').val())) : -1;
        var quantity = parseInt($('#quantityCarPart').val());
        var categoryID = $('#categoryIdCarPart').val();
        var warranty = parseInt($('#warrantyCarPart').val());
        var origin = parseInt($('#originIdCarPart').val());
        var manufacturer = parseInt($('#manufacturerIdCarPart').val());
        var metaKeyword = $('#metaKeywordsCarPart').val();
        var status = $('#statusCarPart').prop('checked');
        var seotitle = $('#seotitleCarPart').val();
        var metaDescript = $('#metaDescriptionsCarPart').val();
        var CarPart = {
            ID: id,
            Name: name,
            Code: code,
            SeoTitle: seotitle,
            Description: descript,
            Image: image,
            Price: price,
            PromotionPrice: promotion,
            Quantity: quantity,
            CategoryID: categoryID,
            Warranty: warranty,
            OriginID: origin,
            ManufacturerID: manufacturer,
            MetaKeywords: metaKeyword,
            MetaDescriptions: metaDescript,
            Status: status,
        };
        $.ajax({
            url: '/Admin/CarPart/CreateEditCarPart',
            data: {
                strCarpart: JSON.stringify(CarPart),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.res == 1) {
                    toastr.success("Thêm phụ tùng thành công!", "Success");
                    carpartController.loadCarPart();
                }
                else if (response.res == 2) {
                    toastr.success("Sửa thông tin phụ tùng thành công!", "Success");
                    carpartController.loadCarPart();
                }
                else toastr.error("Thêm phụ tùng không thành công!", "Error");
                $('#createEditCarPartModal').modal('hide');
            },
            error: function (err) {
                toastr.error(err.error, "Error");
                $('#createEditCarPartModal').modal('hide');
            }
        })
    },
    deleteCarPart: function (id) {
        $.ajax({
            url: '/Admin/CarPart/DeleteCarPart',
            data: {
                Id: id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.mes) {
                    toastr.success("Xoá bản ghi thành công!", "Success");
                    carpartController.loadCarPart();
                }
                else toastr.warning("Xoá bản ghi không thành công!", "Warning");
            },
            error: function (err) {
                toastr.error(err.error, "Error");
            }
        });
    },
    changeStatusCarPart: function (id, btn) {
        $.ajax({
            url: '/Admin/CarPart/ChangeStatus',
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
    resetForm: function(){
        $('#idCarPart').val(0);
        $('#nameCarPart').val('');
        $('#imageCarpart').val('');
        CKEDITOR.instances["descriptionCarPart"].setData("");
        $('#descriptionCarPart').val("");
        $('#codeCarPart').val('');
        $('#priceCarPart').val(0);
        $('#warrantyCarPart').val(0);
        $('#metaKeywordsCarPart').val('');
        $('#statusCarPart').prop('checked', false);
        $('#seotitleCarPart').val('');
        $('#metaDescriptionsCarPart').val('');
        $('#quantityCarPart').val(0);
        $('#promotionChecked').prop('checked', false);
        $('.input-number-carpart').prop('hidden', true);
        $('#promotionPrice').val(0);
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
    pagingCarPart: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / carpartconfig.pageSize);
        $('#pagination-carpart').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                carpartconfig.pageIndex = page;
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
    }
}
carpartController.init();