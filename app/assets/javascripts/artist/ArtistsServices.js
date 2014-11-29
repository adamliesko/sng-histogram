var app = angular.module('sng-histogram');

app.factory('ArtistsFactory', ['$resource',function ($resource) {
    return $resource('/artists/:id', {id: '@_id' }, {
        query: { method: 'GET', isArray: true },
        get: { method: 'GET', isArray: false }
    })
}]);