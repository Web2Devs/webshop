

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
        });

});

appmvc.controller('MenuLeftController', function ($scope, $http) {
    $scope.menuleft = [];
    $http.get('/Content/menuleft.json')
        .success(function (data) {
            $scope.menuleft = data;
        })
        .error(function (data, status, headers, config) {
            console.log("error");
        }).finally(function () {
        });
});

appmvc.controller('LoginController', function ($scope, $http, RestService) {
    $scope.accessToken = "";
    $scope.refreshToken = "";

    $scope.redirect = function () {
        window.location.href = '/Cliente/Index';
    };

    $scope.login = function (cred) {
        var userLogin = {
            grant_type: 'password',
            username: cred.usuario,
            password: cred.passwd
        };
        var res_data = LoginService.login(userLogin);

        res_data.then(function (resp) {
            console.log(resp);
        }, function (err) {
            console.log(err);
        });

        console.log(cred);
    };
});

appmvc.controller('CategoriaController', function ($scope) {
    $scope.categorias = [];
    $http.get('/Content/categorias.json')
        .success(function (data) {
            $scope.categorias = data;
        })
        .error(function (data, status, headers, config) {
            console.log("error");
        }).finally(function () {
        });
});


appmvc.controller('SubCategoriaController', function ($scope) {

});

appmvc.controller('ProductoController', function ($scope) {

});