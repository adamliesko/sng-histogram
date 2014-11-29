'use strict';

var app = angular.module('sng-histogram', ['ngResource']);

app.config(["$httpProvider", function (provider) {
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    provider.defaults.headers.common['Cache-Control'] = 'no-cache';
    provider.defaults.headers.common['Accept'] = 'application/json';
    provider.defaults.headers.common['Content-Type'] = 'application/json';
}]);