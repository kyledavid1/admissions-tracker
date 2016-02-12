class AdmissionOfficersController < ApplicationController

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])
#getting error of invalid hash somewhere within password_digest. Check and re-check names to make sure everything matches.
		if admin_user && admin_user.authenticate(params['password_digest'])
			session[:user_name] = admin_user.email
			@admin = session[:user_name]

			cookies[:username] = admin_user.email
			cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}

			redirect_to :admission_officers
		else
			@error = true
			render :login_form
		end
	end

	def index 
		@students = Student.all
	end

	def show
		# @admin = AdmissionOfficer.find(params[:id])
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
