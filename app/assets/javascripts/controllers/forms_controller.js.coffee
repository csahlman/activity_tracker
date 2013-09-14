angular.module('venture').controller 'FormsCtrl', ($scope) ->

  $scope.areas = ['Boulder', 'Denver']
  $scope.businessTypes = ['Services', 'Products']


  $scope.saveState = ->
    console.log "saved"