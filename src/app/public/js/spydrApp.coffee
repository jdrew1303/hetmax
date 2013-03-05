spydrApp = angular.module 'spydrApp', ['ngResource', 'spydrApp.product', 'ngGrid']

spydrApp.config [
  "$routeProvider"
  "$locationProvider"
  ($routeProvider, $locationProvider) ->
    $routeProvider.when "/",
      templateUrl: "partials/navarrete"
    $routeProvider.otherwise redirectTo: "/"
    $locationProvider.html5Mode true
]
