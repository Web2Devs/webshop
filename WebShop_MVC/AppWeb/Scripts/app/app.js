

var appmvc = angular.module('appmvc', ['angular-loading-bar', 'ngStorage'], function ($locationProvider) {
    //$locationProvider.html5Mode(true);
});

appmvc.controller('HomeController', function ($scope, $http) {
    $scope.productos = [];
    $scope.loading = true;
    $http.get('/Content/promo.json')
        .success(function (data) {
            $scope.productos = chunkArray(data, 3);
        })
        .error(function (data, status, headers, config) {
            console.log("error");
        }).finally(function () {
            $scope.loading = false;
        });

});

appmvc.controller('MenuLeftController', function ($scope, RestService) {
    $scope.menuleft = [];
    RestService.categoriactl()
        .then(function (data) {
            $scope.menuleft = data;
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

appmvc.controller('ProductoController', function ($scope, RestService, ShopService) {
    $scope.producto = {};
    
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
            id: $scope.producto.CodProducto,
            Cantidad: 1
        };
        console.log(pro);

        alertify.alert("Producto Agregado.", function () {
            alertify.message('OK');
            ShopService.addProducto(pro);
        });
    };
});

appmvc.controller('CarritoController', function ($scope, RestService, ShopService) {
    ShopService.LoadShop();
    $scope.shop_list = ShopService.getShopList();
});