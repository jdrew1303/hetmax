productModule = angular.module 'spydrApp.product',
[
  'ngResource'
]

productModule.controller "productGridController",
[
  '$scope'
  'spydrApp.product.mainService'
  ($scope,
   prdService) ->
      $scope.products = prdService.getProducts()
      $scope.myData = []
      $scope.gridOptions =
        data      : 'myData'
        columnDefs: [
          {field: 'source', displayName: 'Fuente'}
          {field: 'urlV', displayName: 'Vendedor'}
          {field: 'itemPrice', displayName: 'Precio', cellFilter:'currency:" €"'}
          {field: 'shippingPrice', displayName: 'Gasto Envío', cellFilter:'currency:" €"'}
          {field: 'total', displayName: 'Precio Final', cellFilter:'currency:" €"'}
        ]
      $scope.updateProductInfo = ->
        console.log $scope.selectedProductId
        if $scope.selectedProductId
          $scope.myData = prdService.getProductBPI($scope.selectedProductId)
]

productModule.factory 'spydrApp.product.mainService',
[
  '$http'
  ($http) ->
      getProducts  : ->
          products =
          [{id: '3TL941C', d: 'Lavadora Carga Superior BALAY 3TL941C'},
           {id: '3TS997', d: 'Lavadora Carga Frontal BALAY 3TS997'},
           {id: '3TS84122A', d: 'Lavadora Carga Frontal BALAY 3TS84122A'},
           {id: '3TS84102A', d: 'Lavadora Carga Frontal BALAY 3TS84102A'},
           {id: '3TS84122X', d: 'Lavadora Carga Frontal BALAY 3TS84122X'}
          ]
          products
      getProductBPI: (pid)->
          promise = $http.get('/api/1/'+pid).then (response)->
            bpi = response.data.info
            _.map bpi, (item)->
              item.total = item.itemPrice + item.shippingPrice
            bpi
          promise
]