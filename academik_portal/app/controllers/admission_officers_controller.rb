class AdmissionOfficersController < ApplicationController


	def index 
		@admin_officers = AdmissionOfficer.all
	end

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])
#getting error of invalid hash somewhere within password_digest. Check and re-check names to make sure everything matches.
		if admin_user && admin_user.authenticate(params['password'])
			session[:admin_name] = admin_user.email
			session[:user_id] = admin_user.id
			@admin = session[:email]

			cookies[:email] = admin_user.email
			cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}

			redirect_to admission_officer_path(admin_user)
		else
			@error = true
			render :login_form
		end
	end

	def show
		# I want to display students that belong to their particular admin officer. Reference student to admission_officer_id? Admission officer id is currently nil. We need to assign that a value before we can associate that ao with students.
		@admin_officer = AdmissionOfficer.find(params[:id])
		# @students = Student.where(admission_officer: display the students that belong to the admin officer.)
		@students = Student.all
		# if @student.id == @admin_officer
		# 	@students
		# else
		# 	render :admission_officer_path
		# end
	end

	def new
		@admin_officer = AdmissionOfficer.new
	end

	def create
		@admin_officer = AdmissionOfficer.create(params['admin_officer'].permit(:name, :email))
		if @admin_officer.save
			redirect_to admission_officer_path(@admin_officer)
		else
			render :new_admission_officer
		end
	end

	def edit
		@admin_officer = AdmissionOfficer.find(params[:id])
		if @admin_officer.save
			redirect_to admission_officer_path(admin_officer.id)
		else
			render :edit
		end
	end

	def update
		@admin_officer = AdmissionOfficer.find(params[:id])
		@admin_officer.update(name: params["admission_officer"]["name"], email: params["admission_officer"]["email"])
		redirect_to admission_officer_path
	end

end
