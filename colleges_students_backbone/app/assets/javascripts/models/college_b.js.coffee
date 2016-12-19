class CollegesStudentsReact.Models.CollegeB extends Backbone.Model

	routes:
		'': 'index'

	initialize: ->
		@collection = new CollegesStudentsReact.Collections.StudentBs()
		@collection.fetch()

	index: ->
		view = new CollegesStudentsReact.Views.StudentBsIndex(collection: @collection)
		$('#container').html(view.render().el)
