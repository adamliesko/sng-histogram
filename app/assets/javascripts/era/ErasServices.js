var app = angular.module('sng-histogram');

app.factory('ErasFactory', ['$resource',function ($resource) {
    return $resource('artists/:artist_id/eras/:id', {id: '@_id' }, {
        query: { method: 'GET', isArray: true },
        get: { method: 'GET', isArray: false }
    })
}]);


app.factory('ErasService', function ($http) {

    var ErasService = {
        getAggregatedEra: function (id) {
            // $http returns a 'promise'
            params: {artist_id: id}
            return $http.( url: "/aggregated_histogram/:artist_id.json",
                method: "GET",
                params: {artist_id: id}).then(function (response) {
                return response.data;
            });
        }
    };

    return ErasService;
});