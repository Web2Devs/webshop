var SERVICE_PATH = "http://localhost:4625/RestService.svc";

appmvc.service('RestService', function ($http) {
    this.data_categorias = null;
    this.sub_categorias = null;
    this.data_productos = null;
    this.data_productos_cate = null;

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
    
    this.subcategoriacatectl = function (id, update) {
        if (update || !this.sub_categorias)
            this.sub_categorias = $http.get(SERVICE_PATH + '/SubCategoriaCate/' + id)
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

    this.productosubctl = function (id, update) {
        if (update || !this.data_productos)
            this.data_productos = $http.get(SERVICE_PATH + '/ProductosSubCate/' + id)
                .then(function (response) {
                    console.log(response);
                    return response.data;
                },
                function (errResponse) {
                    console.error('Error while fetching users');
                    if (this.data_productos)
                        return this.data_productos;
                    else
                        return [];
                });
        return this.data_productos;
    };

    this.productocatectl = function (id, update) {
        if (update || !this.data_productos_cate)
            this.data_productos_cate = $http.get(SERVICE_PATH + '/ProductosCate/' + id)
                .then(function (response) {
                    console.log(response);
                    return response.data;
                },
                function (errResponse) {
                    console.error('Error while fetching users');
                    if (this.data_productos_cate)
                        return this.data_productos_cate;
                    else
                        return [];
                });
        return this.data_productos_cate;
    };


    this.productoinfoctl = function (id) {
        return $http.get(SERVICE_PATH + '/Producto/' + id)
               .then(function (response) {
                   return response.data;
               },
               function (errResponse) {
                   console.error('Error while fetching users');
                   return {};
               });
    };
});