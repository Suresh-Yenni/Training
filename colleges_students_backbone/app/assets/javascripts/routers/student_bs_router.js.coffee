class CollegesStudentsReact.Routers.StudentBs extends Backbone.Router

	routes:
		'': 'index'

	index: ->
		view = new CollegesStudentsReact.Views.StudentBsIndex()
		$('#option').html(view.render().el)