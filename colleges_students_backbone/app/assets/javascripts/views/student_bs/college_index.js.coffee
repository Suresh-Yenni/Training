class CollegesStudentsReact.Views.CollegeIndex extends Backbone.View

	template: JST['student_bs/colleges']

	initialize: ->
		@collection.bind('add', @render, this)

	render: ->
		$(@el).html(@template(colleges: @collection))
		this

	