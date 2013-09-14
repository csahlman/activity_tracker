angular.module('venture', ['ngRoute'])

angular.module('venture').config ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data

angular.module('venture').config(($routeProvider) ->
  $routeProvider.when('/',
    controller: 'FormsCtrl'
    templateUrl: '/assets/forms/start.html'
  )
)