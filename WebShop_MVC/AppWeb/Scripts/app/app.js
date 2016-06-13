

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

function chunkArray(array, chunkSize) {
    var result = [];
    var currentChunk = [];
    for (var i = 0; i < array.length; i++) {
        currentChunk.push(array[i]);
        if (currentChunk.length == chunkSize) {
            result.push(currentChunk);
            currentChunk = [];
        }
    }
    if (currentChunk.length > 0) {
        result.push(currentChunk);
    }
    return result;
}