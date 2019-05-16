var cartController = {
    init: function () {

        cartController.registerEvents();

    },
    registerEvents: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = '/phu-tung/tat-ca-phu-tung-20';
        });
        $('#btnUpdate').off('click').on('click', function () {
            var listCarpart = $('.quantity');

            var cartlist = [];
            $.each(listCarpart, function (i, item) {
                var index = parseInt($(item).val().toString().replace(/,/g, ''));
                if (index > parseInt($(item).prop('max'))) index = parseInt($(item).prop('max'));
                if (index < parseInt($(item).prop('min'))) index = parseInt($(item).prop('min'));
                cartlist.push({
                    Quantity: index,
                    CarPart: {
                        ID: $(item).data('id'),
                    }
                })
            });

            $.ajax({
                url: '/Cart/Update',
                data: { cartModel: JSON.stringify(cartlist), },
                dataType: 'json',
                type: 'POST',
                success: function(response)
                {
                    if (response.res == true) {
                        window.location.href = '/gio-hang';
                    }
                }
            });
        });
        $('#btnDeleteAll').off('click').on('click', function () {
            $.ajax({
                url: '/Cart/DeleteAll',
                data: { },
                dataType: 'json',
                type: 'POST',
                success: function (response) {
                    if (response.res == true) {
                        window.location.href = '/gio-hang';
                    }
                }
            });
        })
        $('.btn-delete-cartitem').off('click').on('click', function () {
            if(confirm("Bạn có chắc chắn muốn xoá sản phẩm này?"))
            {
                var itemID = parseInt($(this).data('id'));
                $.ajax({
                    url: '/Cart/DeleteItem',
                    data: {
                        itemID: itemID,
                    },
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        if (response.res == true) {
                            window.location.href = '/gio-hang';
                        }
                    }
                });
            }
        })
        $('#btnPay').off('click').on('click', function () {
            window.location.href = '/thanh-toan';
        });
    },
}

cartController.init();