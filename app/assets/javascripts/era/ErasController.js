var app = angular.module('sng-histogram');

app.controller('ErasController', ['$scope', '$http', 'ErasFactory','ErasService', function ($scope, $http,ErasFactory,ErasService) {


    // Assign service to scope if you'd like to be able call it from your view also
    $scope.avengers = AvengersService;

    // Call the async method and then do stuff with what is returned inside the function


    $scope.viewAggregatedHistogram = function (id) {

        ErasService.getAggregatedEra(id).then(function (asyncCastData) {
            $scope.era = asyncCastData;
        });

    };

}]);
