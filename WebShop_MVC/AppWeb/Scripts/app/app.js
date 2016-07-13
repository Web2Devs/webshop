

var appmvc = angular.module('appmvc', ['angular-loading-bar', 'ngStorage', 'ngDialog'], function ($locationProvider) {
    //$locationProvider.html5Mode(true);
});

appmvc.controller('HomeController', function ($scope, $http) {
    $scope.productos = [];
    $scope.loading = true;
    
    var data = [];
    data.push({
        CodProducto: 1,
        Nombre: "CASE ANTRYX ELEGANT BATTLESHIP ( AC-EU120-NN ) 300W",
        Precio: 100,
        Descripcion: "ANTRYX"
    });

    data.push({
        CodProducto: 24,
        Nombre: "HDD EXTERNO ADATA 1 TERA HD720 ( AHD720-1TU3-CBK/CGR/CBL ) ANTI GOLPE",
        Precio: 250,
        Descripcion: "ADATA"
    });

    $scope.productos = chunkArray(data, 3);
    $scope.loading = false;
});

appmvc.controller('MenuRightController', function ($scope, RestService) {
    $scope.goCarrito = function () {
        window.location.pathname = "/Carrito";
    };
});

appmvc.controller('MenuLeftController', function ($scope, RestService) {
    $scope.menuleft = [];
    RestService.categoriactl()
        .then(function (data) {
            $scope.menuleft = data;
            //console.log(data);
        },
        function () {

        });
});

appmvc.controller('CategoriaController', function ($scope, $location, RestService) {
    $scope.subcategorias = [];
    var pathArray = window.location.pathname.split('/');
    var meth = pathArray[2] || "Lista";
    var pId = pathArray[3] || "Unknown";
    
    console.log(meth, pId);
    if (meth.valueOf("Lista") && pId != "Unknown")
        RestService.subcategoriacatectl(pId)
            .then(function (data) {
                $scope.subcategorias = chunkArray(data, 3);
            });
});


appmvc.controller('SubCategoriaController', function ($scope, RestService) {
    $scope.productos = [];
    var pathArray = window.location.pathname.split('/');
    var meth = pathArray[2] || "Lista";
    var pId = pathArray[3] || "Unknown";
    if (meth.valueOf("Lista") && pId != "Unknown")
        RestService.productosubctl(pId)
            .then(function (data) {
                $scope.productos = chunkArray(data, 3);
            });
});

appmvc.controller('ProductoCateController', function ($scope, RestService, ShopService, ngDialog) {
    $scope.productos = [];
    var pathArray = window.location.pathname.split('/');
    var meth = pathArray[2] || "Lista";
    var pId = pathArray[3] || "Unknown";
    if (meth.valueOf("Lista") && pId != "Unknown")
        RestService.productocatectl(pId)
            .then(function (data) {
                $scope.productos = chunkArray(data, 3);
            });

    $scope.AddProductoCart = function (id) {
        RestService.productoinfoctl(id)
            .then(function (data) {
                producto = data;
                var pro = {
                    id: parseInt(id, 10),
                    Cantidad: parseInt(1, 10),
                    Producto: producto
                };

                alertify.success('Producto Agregado: ' + producto.Nombre),
                ShopService.addProducto(pro);
            });
        return false;
    };

    $scope.ShowInfoDialog = function (id) {
        var dialog = ngDialog.open({
            template: '/Content/vistas/ProductoInfox.html', className: 'ngdialog-theme-default', controller: function ($scope, RestService, ShopService) {
                $scope.Cantidad = 1;
                RestService.productoinfoctl(id)
                    .then(function (data) {
                        $scope.producto = data;
                    });
                $scope.AddProducto = function () {
                    var pro = {
                        id: parseInt($scope.producto.CodProducto, 10),
                        Cantidad: parseInt($scope.Cantidad, 10),
                        Producto: $scope.producto
                    };

                    alertify.success('Producto Agregado: ' + $scope.producto.Nombre),
                    ShopService.addProducto(pro);
                    dialog.close();
                };
            }
        });
    };
});

appmvc.controller('ProductoController', function ($scope, RestService, ShopService) {
    $scope.producto = {};
    $scope.Cantidad = 1;
    var pathArray = window.location.pathname.split('/');
    var meth = pathArray[2] || "Info";
    var pId = pathArray[3] || "Unknown";

    if (meth.valueOf("Info") && pId != "Unknown")
        RestService.productoinfoctl(pId)
            .then(function (data) {
                $scope.producto = data;
            });

    $scope.AddProducto = function () {
        var pro = {
            id: parseInt($scope.producto.CodProducto, 10),
            Cantidad: parseInt($scope.Cantidad, 10),
            Producto: $scope.producto
        };

        alertify.success('Producto Agregado: ' + $scope.producto.Nombre),
        ShopService.addProducto(pro);
    };

   
});

appmvc.controller('CarritoController', function ($scope, RestService, ShopService) {
    ShopService.LoadShop();
    $scope.shop_list = ShopService.getShopList();
    
    $scope.PrecioTotal = ShopService.calcularPrecioTotal();
    $scope.CalcularTotal = function () {
        $scope.PrecioTotal = ShopService.calcularPrecioTotal();
    };

    $scope.ValidarValue = function (item) {
        if (item.Cantidad == null || item.Cantidad == 0)
            item.Cantidad = 1;
        $scope.CalcularTotal();
    };

    $scope.EliminarItem = function ($index) {
        $scope.shop_list.splice($index, 1);
        alertify.success('Se elimino el producto');
        $scope.CalcularTotal();
        /*alertify.confirm("Se eliminara el producto.",
            function () {
                console.log($index);
                $scope.apply();
            },
            function () {
                alertify.error('Cancel');
            });*/
    };

    $scope.goHome = function () {
        window.location.pathname = "/home";
    };

    $scope.submitForm = function () {
        ShopService.SendCompra();
    };

    $scope.ConfirmarMetodo = function () {
        window.location.pathname = "/Carrito/Confirm";
    };

    $scope.CheckValidCard = function (cardItem) {
        console.log(cardItem);
    };

    $scope.CompraCompleta = function () {
        ShopService.clearShop();
    };
});