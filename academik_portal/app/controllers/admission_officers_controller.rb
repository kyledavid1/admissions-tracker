class AdmissionOfficersController < ApplicationController


  before_action except: [:login, :login_form] do
	  redirect_to admission_officers_login_form_path unless authorized?
	end

	def index 
		@admin_officers = AdmissionOfficer.all
	end

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])

		if admin_user && admin_user.authenticate(params['password'])
			session[:user_type] = 'AdmissionOfficer'
			session[:user_id] = admin_user.id
			@admin = session[:email]

			cookies[:email] = admin_user.email
			cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}
			# binding.pry
			redirect_to admission_officer_path(admin_user)
		else
			@error = true
			render :login_form
		end
	end

	def show
		
		@admin_officer = AdmissionOfficer.find(params[:id])
		@students = Student.where(application_status: 'Phone Interview Pending')
		flash[:success] = "Login Succesful!"
		@students_scheduled = Student.where(application_status: 'Phone Interview Scheduled', admission_officer_id: params[:id])
		@students_interviewed = Student.where(application_status: 'In-Person Interview Pending', admission_officer_id: params[:id])
		
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

	def authorized?
		!current_user.nil? || current_user.is_a?(AdmissionOfficer)
	end

end
