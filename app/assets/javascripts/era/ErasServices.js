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

            return $http( {url: "/aggregated_histogram/",
                method: "GET",
                params: {id: id}}).then(function (response) {
                return response.data;
            });
        },
        getSelectedEra: function (id) {
            // $http returns a 'promise'

            return $http( {url: "/selected_histogram/:id",
                method: "GET",
                params: {id: id,date_from: date_from, date_to: date_to, level: level}}).then(function (response) {
                return response.data;
            });
        }
    };



    return ErasService;
});