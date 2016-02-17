class StudentsController < ApplicationController

	before_action except: [:login, :login_form, :new, :create, :edit, :destroy] do
		if current_user.nil? || (current_user.is_a?(Student) && params[:id].to_i != current_user.id)
			redirect_to '/students/id'
		end
	end

    def login
    	student_user = Student.find_by(email: params['email'])

    	if student_user && student_user.authenticate(params['password'])
    		session[:user_type] = 'Student'
    		session[:user_id] = student_user.id
    		@student = session[:email]

    		cookies[:email] = student_user.email
    		redirect_to student_user
    	else
    		@error = true
    		render :login_form
    	end
    end

    def logout 
    	session.delete('user_id')
    	redirect_to '/'
  	end

	def index
	end

	def show

		@student = Student.find(params[:id])

	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.create(name: params[:name], email: params[:email], phone_number: params[:phone_number], password: params[:password], course: params[:course], application_essay: params[:application_essay], picture: params[:picture], application_status: "Phone Interview Pending" )
		respond_to do |format|
			if @student.save
				StudentMailer.welcome_email(@student).deliver_now
				format.html { redirect_to '/students/login_form', notice: 'Student was successfully created'}
				format.json { render :show, status: :created, location: @student }
			else
				format.html { render :new}
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit
    	@student = Student.find(params[:id])
    end

    def student_params 
		params.require(:student).permit(:name, :email, :phone_number, :password)
	end

	def update
		@id = params[:id]
  		@student = Student.find(@id)
        if session[:user_type] == 'Student'
          	@student.update(student_params)
          	respond_to do |format|
			if @student.save
				StudentMailer.edit_email(@student).deliver_now
				format.html { redirect_to '/students/login_form', notice: 'You successfully edited your profile.'}
				format.json { render :show, status: :created, location: @student }
			else
				format.html { render :new}
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
        elsif session[:user_type] == 'Admission Officer'
         	@student.update_attributes(application_status: "Phone Interview Scheduled", admission_officer_id: session[:user_id])
        else session[:user_type] == 'Instructor'
       		@student.update_attributes(application_status: "In-Person Interview Scheduled", instructor_id: session[:user_id])
       		redirect_to instructor_path(session[:user_id])
        end
    end

    def destroy
    	@student = Student.find(params[:id])
    	@student.destroy
    end
end
