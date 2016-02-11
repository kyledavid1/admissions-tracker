class AdmissionsofficersController < ApplicationController

	def index 
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
		@student = Student.find(params[:id])
		if @student.save
			redirect_to student_path(student.id)
		else
			render :edit
		end
	end

	def update
		@student = Student.find(params[:id])
	end

end
