

var appmvc = angular.module('appmvc', ['angular-loading-bar'], function ($locationProvider) {
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
    if (meth.valueOf("Lista"))
        RestService.subcategoriactl(pId)
            .then(function (data) {
                $scope.subcategorias = data;
            });
});


appmvc.controller('SubCategoriaController', function ($scope) {

});

appmvc.controller('ProductoController', function ($scope) {

});