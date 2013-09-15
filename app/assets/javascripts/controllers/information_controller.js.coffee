angular.module('venture').controller 'InformationCtrl', ($scope, $http, $location) ->
  $scope.llcAttorneys = [
    { name: "Saul", location: "Denver", cost: 2500, phoneNumber: '617-555-4949' },
    { name: "Walt", location: "Broomfield", cost: 2360, phoneNumber: '303-555-2949' },
    { name: "Frank", location: "Boulder", cost: 3000, phoneNumber: '202-145-2000' }
  ]