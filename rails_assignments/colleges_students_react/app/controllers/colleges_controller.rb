class CollegesController < ApplicationController

	def home;
	end

	def search
		@college = College.select('id, name, establish').where('name like ?', "%#{params[:college][:name]}%")
	end

	def index
		@college = College.select('id, name, establish').all
	end

	def show
		@student = Student.select('regid, dept, year').where(college_id: params[:id])
	end

	def new
		@college = College.new
	end

	def create
		College.new(params.require(:college).permit!).save
		redirect_to colleges_path
	end

	def edit
		@college = College.find_by_id(params[:id])
	end

	def update
		College.college_on_id(params[:id]).update_attributes(params.require(:college).permit!)
		redirect_to colleges_path
	end

	def destroy
		College.college_on_id(params[:id]).destroy
		redirect_to colleges_path
	end

end
