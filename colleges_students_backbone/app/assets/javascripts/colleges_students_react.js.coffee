window.CollegesStudentsReact =
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
    initialize: -> 
  		new CollegesStudentsReact.Routers.StudentBs()
  		Backbone.history.start()

	$(document).ready ->
    	CollegesStudentsReact.initialize()
