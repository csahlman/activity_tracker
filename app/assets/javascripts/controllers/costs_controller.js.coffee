angular.module('venture').controller 'CostsCtrl', ($http, $scope, $location) ->

  
  
  $scope.back = ->
    $scope.saveState()
    $location.path('/')

  $scope.continue = ->
    $scope.saveState()
    $location.path('/legal')

