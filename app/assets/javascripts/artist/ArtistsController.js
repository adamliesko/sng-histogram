var app = angular.module('sng-histogram');

app.controller('ArtistsController', ['$scope', '$http', 'ArtistsFactory', function ($scope, $http, ArtistsFactory) {

    $scope.initArtists = function () {

        $scope.artists = ArtistsFactory.query(function () {
            console.log(2);
        });
    };


}]);

