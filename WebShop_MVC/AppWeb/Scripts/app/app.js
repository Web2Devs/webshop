

var appmvc = angular.module('appmvc', ['angular-loading-bar']);



appmvc.controller('HomeController', function ($scope, $http) {
    $scope.productos = [];
    $http.get('/Content/promo.json')
        .success(function (data) {
            $scope.productos = chunkArray(data, 3);
        })
        .error(function (data, status, headers, config) {
            console.log("error");
        });
});


appmvc.controller('CategoriaController', function ($scope) {

});


appmvc.controller('SubCategoriaController', function ($scope) {

});

appmvc.controller('ProductoController', function ($scope) {

});