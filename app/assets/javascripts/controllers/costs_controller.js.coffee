angular.module('venture').controller 'CostsCtrl', ($http, $scope, $location) ->

  $scope.developers = [
    { name: "John Foo", salary: 82000 },
    { name: "John Bar", salary: 104000 },
    { name: "Baz Foo", salary: 67000 }
  ]


  
  $scope.back = ->
    $scope.saveState()
    $location.path('/')

  $scope.continue = ->
    $scope.saveState()
    $location.path('/legal')

