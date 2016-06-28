var SERVICE_PATH = "http://localhost:4625/RestService.svc";

appmvc.service('RestService', function ($http) {

    this.categoriactl = function () {
        return $http.get(SERVICE_PATH + '/Categorias')
            .then(function (response) {
                return response.data;
            },
            function (errResponse) {
                console.error('Error while fetching users');
                return [];
            });
    };
    
});