class AdmissionOfficersController < ApplicationController


# before_action except: [:login, :login_form] do
# 		if current_user.nil? || (current_user.is_a?(AdmissionOfficer) && params[:id].to_i != current_user.id)
# 			redirect_to admission_officers_login_form_path
# 		end
# 	end
#when uncommented this forces me to login again even after I login.
	def index 
		@admin_officers = AdmissionOfficer.all
	end

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])
#getting error of invalid hash somewhere within password_digest. Check and re-check names to make sure everything matches.
		if admin_user && admin_user.authenticate(params['password'])
			session[:user_type] = 'Admission Officer'
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
		# I also want to view all the students by clicking on a link.
		# I want to display students that belong to their particular admin officer. Reference student to admission_officer_id? Admission officer id is currently nil. We need to assign that a value before we can associate that ao with students.
		@admin_officer = AdmissionOfficer.find(params[:id])
		@students = Student.where(application_status: 'Phone Interview Pending')
		flash[:success] = "Login Succesful!"
		#display the students that belong to the admin officer.)
		# @students = Student.all
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
		#this is not saving anything to the db.
		@admin_officer = AdmissionOfficer.create(admission_officer_params)
		if @admin_officer.save
			flash[:success] = "Admission Officer Created!"
			redirect_to admission_officers_path
		else
			render :new
		end
	end

	def edit
		@admin_officer = AdmissionOfficer.find(params[:id])
	end

	def update
		@admin_officer = AdmissionOfficer.find(params[:id])
		@admin_officer.update(admission_officer_params)

		if @admin_officer.save
			redirect_to admission_officer_path		
		else
			render :edit
		end
	end

	def logout 
    	session.delete('user_id')
    	redirect_to root_path
  	end

	private

	def admission_officer_params
		params.require(:admission_officer).permit(:name, :email, :password)
	end

end
