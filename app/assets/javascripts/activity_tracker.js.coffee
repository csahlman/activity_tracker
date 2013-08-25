window.Tracker = 
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    @router = new Tracker.Routers.Activities({})
    Backbone.history.start()
