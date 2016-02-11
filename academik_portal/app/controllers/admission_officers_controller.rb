class AdmissionOfficersController < ApplicationController

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])

		if admin_user && admin_user.authenticate(params['password'])
			session[:user_name] = admin_user.email
			@admin = session[:user_name]

			cookies[:username] = admin_user.email
			cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}

			render :index
		else
			@error = true
			render :index
		end
	end

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
