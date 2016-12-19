class CollegesController < ApplicationController

	def home; 
	end

	def view
	    @colleges = College.all
	    render :json => @colleges
	end

	def search
		str = params[:college][:name]
		@college = College.where('name like ?', "%#{str}%")
	end

	def index
		@college = College.all
	end

	def show
		@student = Student.select('regid, dept, year').where(college_id: params[:id])
	end

	def new
		@college = College.new
	end

	def create
		@college = College.new(params.require(:college).permit!)
		@college.save
		redirect_to colleges_path
	end

	def edit
		@college = College.find(params[:id])
	end

	def update
		@college = College.find(params[:id])
		@college.update_attributes(params.require(:college).permit!)
		redirect_to colleges_path
	end

	def destroy
		college = College.find(params[:id])
		college.destroy
		redirect_to colleges_path
	end

end
