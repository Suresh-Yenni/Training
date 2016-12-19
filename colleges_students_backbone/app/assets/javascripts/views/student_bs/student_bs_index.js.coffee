class CollegesStudentsReact.Views.StudentBsIndex extends Backbone.View

	template: JST['student_bs/index']

	events:
  		'click #students_view': 'show_students'
  		'click #colleges_view': 'show_colleges'
		
	render: ->
		$(@el).html(@template())
		this

	show_students: ->
		@collection = new CollegesStudentsReact.Collections.StudentBs()
		@collection.fetch()
		view = new CollegesStudentsReact.Views.StudentIndex(collection: @collection)
		$('#container').html(view.render().el)
		
	show_colleges: ->
		@collection = new CollegesStudentsReact.Collections.CollegeBs()
		@collection.fetch()
		view = new CollegesStudentsReact.Views.CollegeIndex(collection: @collection)
		$('#container').html(view.render().el)