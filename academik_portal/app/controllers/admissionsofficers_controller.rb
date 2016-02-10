class AdmissionsofficersController < ApplicationController

	def index 
		@students = Students.all
	end

	def show
		@students = Students.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
		@students = Students.find(params[:id])
		if @students.save
		else
			render :edit
		end
	end

	def update
		@students = Students.find(params[:id])
	end

end
