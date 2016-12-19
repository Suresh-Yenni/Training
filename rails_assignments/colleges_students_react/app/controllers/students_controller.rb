class StudentsController < ApplicationController

	def filter
		@students = Student.order(params[:sort])
		@students = @students.all.group_by(&:"#{params[:group]}")
		@display = params[:display]

		first = 0
		second = 0
		@marks_change = {}
		@total_marks = {}

		year1 = !params[:year1].empty? ? Integer(params[:year1]) : nil
		year2 = !params[:year2].empty? ? Integer(params[:year2]) : nil
		total = params[:total]

		@total_marks, @marks_change = Student.compute_change_and_total!(@marks_change, @total_marks, @students, year1, year2, total)

		render json: [@students, @marks_change, @total_marks, @display]
	end

	def query; end

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def create
		student = Student.new(params.require(:student).permit!)
		student.save
		student.update_attribute :extended_sid, "#{student.id}_#{student.college.name[0...2]}"
		redirect_to students_path
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		student = Student.find(params[:id])
		student.update_attributes(params.require(:student).permit!)
		redirect_to students_path
	end

	def destroy
		student = Student.find(params[:id])
		student.destroy
		redirect_to students_path
	end
end
