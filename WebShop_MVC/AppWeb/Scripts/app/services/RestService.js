var SERVICE_PATH = "http://localhost:4625/RestService.svc";

appmvc.service('RestService', function ($http) {
    this.data_categorias = null;
    this.sub_categorias = null;

    this.categoriactl = function (update) {
        if (update || !this.data_categorias)
            this.data_categorias = $http.get(SERVICE_PATH + '/Categorias')
                .then(function (response) {
                    return response.data;
                },
                function (errResponse) {
                    console.error('Error while fetching users');
                    if (this.data_categorias)
                        return this.data_categorias;
                    else
                        return [];
                });
        return this.data_categorias;
    };
    
    this.subcategoriactl = function (id, update) {
        if (update || !this.sub_categorias)
            this.sub_categorias = $http.get(SERVICE_PATH + '/SubCategoria/' + id)
                .then(function (response) {
                    console.log(response);
                    return response.data;
                },
                function (errResponse) {
                    console.error('Error while fetching users');
                    if (this.sub_categorias)
                        return this.sub_categorias;
                    else
                        return [];
                });
        return this.sub_categorias;
    };

});