var viewcarconfig = {
    totalCar: 0,
}

var viewcarController = {
    init: function () {
        viewcarController.registerEvents();
    },
    registerEvents: function () {
        $('.img-small').off('click').on('click', function () {
            $('#img-show').attr('src',$(this).prop('src'));
        });
        $('.btn-car-next').off('click').on('click', function () {
            var check = false;
            var index = 0;
            var img = $(this);
            $.each($('.img-small'), function (i, item) {
                if ($(this).prop('hidden') == false) {
                    img = $(this);
                    return false;
                }
            });
            $.each($('.img-small'), function (i, item) {
                if ($(this).prop('hidden') == true && check == false && index > 3) {
                    $(this).prop('hidden', false);
                    img.prop('hidden', true);
                    return false;
                }
                if ($(this).prop('hidden') == false) {
                    check = false;
                    index = index + 1;
                }
                if ($(this).prop('hidden') == true) {
                    check = true;
                    index = 0;
                }
            });
        });
        $('.btn-car-pre').off('click').on('click', function () {
            var check = false;
            var index = 0;
            var img = $(this);
            if ($('.img-small[data-id=0]').prop('hidden') == true) {
                $.each($('.img-small'), function (i, item) {
                    if ($(this).prop('hidden') == true) { img = $(this); }
                    else return false;
                });
                $.each($('.img-small'), function (i, item) {
                    if ($(this).prop('hidden') == false && index > 3) {
                        $(this).prop('hidden', true);
                        img.prop('hidden', false);
                        return false;
                    }
                    if ($(this).prop('hidden') == false) {
                        check = $(this);
                        index = index + 1;
                    }
                    if ($(this).prop('hidden') == true) {
                        check = true;
                        index = 0;
                    }
                });
            }
        });
    },
}

viewcarController.init();