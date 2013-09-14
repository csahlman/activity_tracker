angular.module('venture').controller 'FormsCtrl', ($scope, $http, $location) ->


  $scope.formData = { }
  $scope.loadedInfo = null
  
  $scope.areas = ['Boulder', 'Denver']
  $scope.businessTypes = ['Services', 'Products']

  $scope.$watch('loadedInfo', (value) ->
    if value?
      $scope.formData.area = value.area
      $scope.formData.business_type = value.business_type
      console.log $scope.formData
  )

  $scope.loadFormData = ->
    $http
      url: '/api/get_form_data'
      method: 'GET'
    .success (data) ->
      $scope.formData = data
      # $scope.loadedInfo = data

  $scope.saveState = ->
    if $scope.formData == {}
      console.log 'foo'
    else
      $http 
        url: '/api/save_data'
        method: 'PUT'
        data: $scope.formData 
      .success (data) ->
        console.log data

  $scope.loadFormData()