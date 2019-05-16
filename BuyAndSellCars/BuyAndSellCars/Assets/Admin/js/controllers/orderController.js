var orderconfig = {
    pageIndex: 1,
    pageSize: 10,
    status: 1,
}

var orderController = {
    init: function () {
        orderController.registerEvents();
    },
    registerEvents: function () {
        $('.btn-edit-order').off('click').on('click', function () {
            var id = $(this).data('id');
            orderController.loadOrderDetail(parseInt(id));
            $('#editOrderModal').modal('show');
        });
        $('#editOrder').off('click').on('click', function () {
            orderController.editOrder();
            $('#editOrderModal').modal('hide');
        });
    },
    loadOrderByStatus: function (status) {
        $.ajax({
            url: '/Admin/Order/GetAllOrder',
            data: { 
                status: status,
                page: orderconfig.pageIndex,
                pageSize: orderconfig.pageSize,
            },
            type: 'GET',
            dataType: 'json',
            success: function(response){
                var data = response.data;
                var date = response.date;
                if (data != "") {
                    var html = '';
                    var oderdata = $('#order-data').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(oderdata, {
                            ID: item.ID,
                            CreatedDate: date[i],
                            ShipName: item.ShipName,
                            ShipMobile: item.ShipMobile,
                            ShipAddress: item.ShipAddress,
                            ShipEmail: item.ShipEmail,
                        });
                    });
                    $('#tblOrder').html(html);
                    orderController.pagingOrder(response.totalRowOrder, function () {
                        orderController.loadOrderByStatus(status, orderconfig.pageIndex, orderconfig.pageSize);
                    });
                }
                else {
                    toastr.info("Không có dữ liệu trong bảng này!", "Thông báo");
                    var oderdata = $('#tblOrder').html('');
                }
                orderController.registerEvents();
            }
        })
    },
    loadOrderDetail: function(id){
        $.ajax({
            url: '/Admin/Order/GetOrderDetail',
            data: { orderId: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var order = response.order;
                var orderdetail = response.orderdetail;
                if (order.Status == 3) { $('#selectStatus').prop('disabled', true); }
                else $('#selectStatus').prop('disabled', false);

                $('#idOrder').val(order.ID);
                $('#shipnameOrder').val(order.ShipName);
                $('#emailOrder').val(order.ShipEmail);
                $('#phoneOrder').val(order.ShipMobile);
                $('#selectStatus').val(order.Status);
                $('#addressOrder').val(order.ShipAddress);

                $('#tblOrderDetail').html('');
                var html = '';
                var sumTotalPrice = 0;
                var detaildata = $('#orderdetail-data').html();
                $.each(orderdetail, function (i, item) {
                    html += Mustache.render(detaildata, {
                        ProductID: item.ProductID == 0 ? "Không Có" : item.ProductID,
                        ProductName: item.ProductName,
                        ProductImg: "<img src='" + item.ProductImg + "' width='70'/>",
                        Quantity: item.Quantity,
                        Price: parseFloat(item.Price.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "đ",
                        TotalPrice: parseFloat(item.TotalPrice.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "đ",
                    });
                    sumTotalPrice = sumTotalPrice + item.TotalPrice;
                });
                sumTotalPrice = parseFloat(sumTotalPrice.toString().replace(/,/g, "")).toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                html += "<tr><td>#</td><td colspan='4'><strong style='text-align:left;'>Tổng:</strong><td>" + sumTotalPrice + "đ</td></tr>";
                $('#tblOrderDetail').html(html);
            }
        })
    },
    editOrder: function(){
        var orderId = parseInt($('#idOrder').val());
        var shipname = $('#shipnameOrder').val();
        var shipemail = $('#emailOrder').val();
        var shipphone = $('#phoneOrder').val();
        var shipaddress = $('#addressOrder').val();
        var status = parseInt($('#selectStatus').val());
        var Order = {
            ID: orderId,
            ShipName: shipname,
            ShipEmail: shipemail,
            ShipMobile: shipphone,
            ShipAddress: shipaddress,
            Status: status,
        }
        $.ajax({
            url: '/Admin/Order/EditOrder',
            data: {
                strOrder: JSON.stringify(Order),
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.mes == true) {
                    toastr.success("Cập nhật thông tin hoá đơn thành công!", "Success");
                    orderController.loadOrderByStatus(orderconfig.status, orderconfig.pageIndex, orderconfig.pageSize);
                }
                else {
                    toastr.error("error", "error");
                }
            }
        });
    },
    pagingOrder: function (totalRow, callback) {
        var totalPage = Math.ceil(totalRow / orderconfig.pageSize);
        $('#pagination-order').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "Đầu",
            prev: "Trước",
            next: "Tiếp",
            last: "Cuối",
            onPageClick: function (event, page) {
                orderconfig.pageIndex = page;
                setTimeout(callback, 200);
            },
        });
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
};
