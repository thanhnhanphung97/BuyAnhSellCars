var searchCarController = {
    init: function () {
        searchCarController.loadMoneyFormat();
        searchCarController.registerEvents();
    },
    registerEvents: function () {
        $('#category-parent').off('click').on('click', function () {
            searchCarController.loadCategoryChild();
        });
        $('#btn-search-car').off('click').on('click', function () {
            var category_parent = $('#category-parent').val() != 0 ? $('#category-parent').val() : -1;
            var category_child = $('#category-parent').val() != 0 ? $('#category-child').val() != 0 ? $('#category-child').val() : -1 : -1;
            var min = parseInt($('#min-price').val().replace(/,/g, ''));
            var max = parseInt($('#max-price').val().replace(/,/g, ''));
            searchCarController.loadListCar(category_parent, category_child, min, max);
        });
        $('#condition-search').off('click').on('click', function () {
            $('#max-price').val('0');
            $('#max-price').val('1000000000');
            $('#category-parent').val(0);
            searchCarController.setActive($("aa"));
            searchCarController.loadCategoryChild();
            setTimeout(function () { $('#category-child').val(0) }, 200);
            searchCarController.loadMoneyFormat();
            searchCarController.loadListCar(-1, -1, 0, 1000000000);
        });
        $('.sort_group div.btn-default').off('click').on('click', function () {
            searchCarController.setActive($(this));
            var category_parent = $('#category-parent').val() != 0 ? $('#category-parent').val() : -1;
            var category_child = $('#category-parent').val() != 0 ? $('#category-child').val() != 0 ? $('#category-child').val() : -1 : -1;
            var min = parseInt($('#min-price').val().replace(/,/g, ''));
            var max = parseInt($('#max-price').val().replace(/,/g, ''));
            var btnsort = $(this).data('id');
            searchCarController.loadListCar(category_parent, category_child, min, max, btnsort);
        });
    },
    moneyFormat: function (str){
        str = parseFloat(str.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return str;
    },
    loadCategoryChild: function () {
        var category_parent = $('#category-parent').val();
        if (category_parent != 0) {
            $.ajax({
                url: '/SearchCar/GetCategoryChild',
                data: {
                    categoryID: category_parent,
                },
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    var data = response.data;
                    if (data != "") {
                        $('#category-child').html('');
                        $.each(data, function (i, item) {
                            $('#category-child').append($('<option>', { value: item.ID, text: item.Name }));
                        });
                    }
                    else {
                        $('#category-child').html('');
                        $('#category-child').append($('<option>', { value: 0, text: 'Chưa Cập Nhật' }));
                    }
                }
            });
        }
        else {
            $('#category-child').html('');
            $('#category-child').append($('<option>', { value: 0, text: 'Chọn Dòng Xe' }));
        }
    },
    loadListCar: function (category_parent, category_child, min, max, btnsort) {
        $.ajax({
            url: '/SearchCar/Search',
            data: {
                category_parent: category_parent,
                category_child: category_child,
                min_price: min,
                max_price: max,
                btnsort: btnsort,
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                var html = '';
                $('.list-car').html('');
                if (data != "") {
                    $.each(data, function (i, item) {
                        if (item.Price < max) {
                            var price = item.Price.toString().length;
                            var indexprice = item.Price.toString().slice(0, price - 6);
                            var prepay = item.PrePay.toString().length;
                            var indexprepay = item.PrePay.toString().slice(0, prepay - 6);
                            html += "<div class='col-md-4 wthree_team_grid' style='max-height: 288px!important;'>"
                                    + "<div class='hovereffect'>"
                                    + "<img src='" + item.Image + "' class='img-responsive' width='240' height='170'/>"
                                    + "<a href='/xe-oto/" + item.MetaTitle + "-" + item.ID + "'><h4 data-id=" + item.ID + ">" + item.Name + "</h4></a>"
                                    + "<div class='car-info'>"
                                    + "<p>" + item.YearOfManufacture + "|" + item.KmTraveled + "Km|" + item.CarColor + "|" + item.Gear + "</p>"
                                    + "</div>"
                                    + "<div>"
                                    + "<div style='float:left;width:38%;font-size: 11px;'><p><span style='font-size:17px;color:red;font-weight:800;'>" + indexprice + "</span> Triệu</p></div>"
                                    + "<div style='float:left;width:60%;font-size: 11px;margin-top: 5px;'><p>$Trả trước " + indexprepay + "Triệu</p></div>"
                                    + "</div></div></div>";
                        }
                    });
                }
                else html = "<div style='text-align:center;font-size: 14px;'><strong>Không tìm được xe nào theo yêu cầu của bạn!</strong></div>";
                $('.list-car').html(html);
            },
            error: function () {
                alert("error");
            }
        });
    },
    loadMoneyFormat: function () {
        var minprice = $('#min-price').val();
        minprice = parseFloat(minprice.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#min-price').val(minprice);

        var maxprice = $('#max-price').val();
        maxprice = parseFloat(maxprice.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#max-price').val(maxprice);
        
        $('#write_price').html($('#min-price').val() + "đ ~" + $('#max-price').val() + "đ");
    },
    setActive: function (btn) {
        $('.sort_group div').removeClass();
        $('.sort_group div').addClass('btn btn-default');
        btn.addClass('active');
    }
};

searchCarController.init();



