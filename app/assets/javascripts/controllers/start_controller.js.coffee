angular.module('venture').controller 'StartCtrl', ($scope, $http, $location) ->

  $scope.continue = ->
    $scope.saveState()
    $location.path('/costs')
