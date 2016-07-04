


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
            found.Cantidad = parseInt(found.Cantidad, 10) + parseInt(item.Cantidad, 10);
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

    this.clearShop = function () {
        $localStorage.Shop = [];
        shop_list = [];
    };

    this.SaveShop = function () {
        $localStorage.Shop = shop_list;
    };

    this.getShopList = function () {
        return $localStorage.Shop;
    };

    this.EliminarProducto = function (id) {
        angular.forEach(shop_list, function (value, key) {
            if (value.id == id)
                shop_list.splice(key, 1);
        });
        this.SaveShop();
    };

    this.calcularPrecioTotal = function () {
        var total = 0;
        angular.forEach(shop_list, function (value, key) {
            var tmp = value.Cantidad * value.Producto.Precio;
            total += tmp;
        });
        return total;
    };

    this.SendCompra = function () {
        $http.post('/Carrito/Compra', JSON.stringify(shop_list))
            .success(function (data, status, headers, config) {
                console.log(data);
                if (data.Tipo == 1) {
                    alertify.error(data.Mensaje);
                    window.location.pathname = "/Cliente/Register";
                } else if (data.Tipo == 2) {
                    alertify.error(data.Mensaje);
                    window.location.pathname = "/Carrito/Index";
                } else {
                    alertify.success(data.Mensaje);
                    window.location.pathname = "/Carrito/MetodoPago";
                }
            });
    };
});