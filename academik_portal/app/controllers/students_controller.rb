class StudentsController < ApplicationController

# GET /users
  # GET /users.json


	# before_action except: [:login, :login_form, :new, :create] do
	# 	if current_user.nil? || (current_user.is_a?(Student) && params[:id].to_i != current_user.id)
	# 		redirect_to '/students/login_form'
	# 	end
	# end

    #this page was last edited on 2/12/16

    def login
    	student_user = Student.find_by(email: params['email'])

    	if student_user && student_user.authenticate(params['password'])
    		#if user exists and password is legit then...
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

    #student actually would not be able to look at this page
	def index
	end

	#student will not be able to search for other students, only look at their own page
	def show
		@id = params[:id]
		@student = Student.find(@id)
		@ao_questionnaire = AoQuestionnaire.new
		# @instructor_questionnaire = InstructorQuestionnaire.find(params[:])
	# 	if student_logged_in
	# 		render : 
	# 		#students will not be able to see this, they will be redirected back to their dashboard
	# 	else
	# 		@student = Student.find(params[:id])
	# 	end
	end

	def new
		@student = Student.new
	end

# POST /users
  # POST /users.json
	def create
		@student = Student.create(name: params[:name], email: params[:email], phone_number: params[:phone_number], password: params[:password], course: params[:course], application_essay: params[:application_essay], application_status: "Phone Interview Pending" )
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

  #   def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       UserMailer.welcome_email(@user).deliver_later
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


	def update
		@id = params[:id].to_i
		@student = Student.find(@id)
        if session[:user_type] == 'Student'
        	@student.update(student_params)
        elsif session[:user_type] == 'Admission Officer'
        	@student.update_attributes!(:application_status => "Phone Interview Scheduled", :admission_officer_id => session[:user_id])
        else session[:user_type] == 'Instructor'
        	@student.update_attributes!(:application_status => "In-Person Interview Scheduled", :instructor_id => session[:user_id])
        end	
        redirect back
    end

    # def schedule
    # 	@student = Student.find(params[:id])
    # 	@student.update_attribute(:application_status, "In-Person Interview Scheduled")
    # end

    # def assign_instructor
    # 	@student = Student.find(params[:id])
    # 	@student.update_attribute(:admission_officer_id, session[:user_id])
    # end

    private

    def student_params 
		params.require(:student).permit(:name, :email, :phone_number, :password)
	end
	# def destroy
	# 	@student = Student.find(params[:id])
	# 	@student.destroy
	# 	redirect_to '/'
	# end

end
