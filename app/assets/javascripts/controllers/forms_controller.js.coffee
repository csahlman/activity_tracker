angular.module('venture').controller 'FormsCtrl', ($scope, $http, $location) ->


  $scope.formData = { 
    developer_quantity: 1
    designer_quantity: 1
  }
  $scope.loadedInfo = null
  $scope.tab = 0
  $scope.areas = ['Boulder', 'Denver']
  $scope.businessTypes = ['Services', 'Products']
  $scope.sideFrame = "info"

  $scope.localCosts = { 
    'developerCost': 84000
    'designerCost': 67000
    'localTaxRate': 8.25
    'officeSpaceCost': 100
    'incorporationCost': 2500
    'legalPerHour': 300
    'domainNameCost': 20
    'hostingCost': 600
  }

  $scope.setFrame = (frame) ->
    $scope.sideFrame = frame

  $scope.setTab = (value) ->
    $scope.tab = value

  $scope.calculateTotalCost = (months) ->
    $scope.calculateFixedCost() + $scope.calculateDeveloperCost()
    # sum += $scope.localCosts.taxRates * $scope.formData.expected_profits

  $scope.calculateFixedCost = (months) ->
    sum = $scope.localCosts.officeSpaceCost * $scope.formData.square_feet
    sum += $scope.localCosts.legalPerHour * $scope.formData.legal_hours
    sum += $scope.localCosts.incorporationCost
    sum += $scope.localCosts.hostingCost
    sum += $scope.localCosts.domainNameCost * $scope.formData.domain_name_quantity

  $scope.calculateDeveloperCost = (months) ->
    sum = $scope.localCosts.developerCost * $scope.formData.developer_quantity
    sum += $scope.localCosts.designerCost * $scope.formData.designer_quantity

  $scope.loadFormData = ->
    $http
      url: '/api/get_form_data'
      method: 'GET'
    .success (data) ->
      $scope.formData = data

  $scope.saveState = ->
    $http 
      url: '/api/save_data'
      method: 'PUT'
      data: $scope.formData 
    .success (data) ->
      console.log data

  $scope.loadFormData()