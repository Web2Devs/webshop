


appmvc.service('ShopService', function ($http, $filter, $localStorage) {
    var shop_list = [];


    this.clearShop = function () {
        shop_list = [];
        return true;
    };

    this.addProducto = function (item) {
        this.LoadShop();
        var found = $filter('getById')(shop_list, item.id);
        if (found == null)
            shop_list.push(item);
        else
            found.Cantidad += item.Cantidad;
        console.log(shop_list, found);
        this.SaveShop();
        return true;
    };

    this.LoadShop = function () {
        if ($localStorage.Shop != null)
            shop_list = $localStorage.Shop;
        else
            $localStorage.Shop = [];
    };

    this.SaveShop = function () {
        $localStorage.Shop = shop_list;
    };

    this.getShopList = function () {

        return $localStorage.Shop;
    };
});