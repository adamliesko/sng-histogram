var app = angular.module('sng-histogram');

app.controller('ErasController', ['$scope', '$http', 'ErasFactory','ErasService', function ($scope, $http,ErasFactory,ErasService) {


    // Assign service to scope if you'd like to be able call it from your view also


    // Call the async method and then do stuff with what is returned inside the function


    $scope.viewAggregatedHistogram = function (id) {

        ErasService.getAggregatedEra(id).then(function (asyncCastData) {
            $scope.era = asyncCastData;

            var colordata = $scope.era.histogram;
            var colordata = [
                {
                    "color": "#00000",
                    "value": "76"
                },
                {
                    "color": "#38di4f",
                    "value": "54"
                },
                {
                    "color": "#E27A3F",
                    "value": "100"
                },
                {
                    "color": "#e00213",
                    "value": "89"
                },
                {
                    "color": "#45B29D",
                    "value": "6"
                },
                {
                    "value": "4",
                    "color": "#000000"
                }
            ];
            var margin = {top: 20, right: 20, bottom: 30, left: 40},
                width = 600 - margin.left - margin.right,
                height = 400 - margin.top - margin.bottom;
            var x = d3.scale.ordinal()
                .rangeRoundBands([0, width], .1);
            var y = d3.scale.linear()
                .range([height, 0]);
            var xAxis = d3.svg.axis()
                .scale(x)
                .orient("bottom");
            var yAxis = d3.svg.axis()
                .scale(y)
                .orient("left")
                .ticks(10, "%");
            d3.select("svg").remove();
            var svg = d3.select("#graph").append("svg")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
                .append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
            x.domain(colordata.map(function (d) {
                return d.color;
            }));
            y.domain([0, d3.max(colordata, function (d) {
                return d.value;
            })]);
            //svg.append("g")
            //        .attr("class", "x axis")
            //        .attr("transform", "translate(0," + height + ")")
            //        .call(xAxis);
            svg.selectAll(".bar")
                .data(colordata)
                .enter().append("rect")
                .attr("class", "bar")
                .attr("x", function (d) {
                    return x(d.color);
                })
                .attr("width", x.rangeBand())
                .attr("y", function (d) {
                    return y(d.value);
                })
                .attr("height", function (d) {
                    return height - y(d.value);
                })
                .style("fill", function (d) {
                    return d.color;
                });
            function type(d) {
                d.frequency = +d.frequency;
                return d;
            }

            console.log($scope.era);
        });

    };

}]);
