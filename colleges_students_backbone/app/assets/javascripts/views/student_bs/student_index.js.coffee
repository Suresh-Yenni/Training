class CollegesStudentsReact.Views.StudentIndex extends Backbone.View

	template: JST['student_bs/students']

	initialize: ->
		@collection.bind('add', @render, this)

	render: ->
		$(@el).html(@template(students: @collection))
		this

	