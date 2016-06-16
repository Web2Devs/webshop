

var appmvc = angular.module('appmvc', ['angular-loading-bar']);



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
        });;
});


appmvc.controller('CategoriaController', function ($scope) {

});


appmvc.controller('SubCategoriaController', function ($scope) {

});

appmvc.controller('ProductoController', function ($scope) {

});