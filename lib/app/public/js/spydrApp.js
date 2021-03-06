// Generated by CoffeeScript 1.5.0
(function() {
  var spydrApp;

  spydrApp = angular.module('spydrApp', ['ngResource', 'spydrApp.product', 'ngGrid']);

  spydrApp.config([
    "$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
      $routeProvider.when("/", {
        templateUrl: "partials/navarrete"
      });
      $routeProvider.otherwise({
        redirectTo: "/"
      });
      return $locationProvider.html5Mode(true);
    }
  ]);

}).call(this);
