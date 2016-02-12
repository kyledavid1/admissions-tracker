class AdmissionOfficersController < ApplicationController


	def index 
		@admin_officers = AdmissionOfficer.all
	end

	def login
		admin_user = AdmissionOfficer.find_by(email: params['email'])
#getting error of invalid hash somewhere within password_digest. Check and re-check names to make sure everything matches.
		if admin_user && admin_user.authenticate(params['password_digest'])
			session[:admin_name] = admin_user.email
			@admin = session[:admin_name]

			cookies[:adminname] = admin_user.email
			cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}

			redirect_to admission_officer_path(admin_user)
		else
			@error = true
			render :login_form
		end
	end

	def show
		# @admin = AdmissionOfficer.find(params[:id])
		@admin_officer = AdmissionOfficer.find(params[:id])
	end

	def new
	end

	def create
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
	end

end
