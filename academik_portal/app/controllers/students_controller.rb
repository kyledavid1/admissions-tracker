class StudentsController < ApplicationController

	# before_action except: [:login, :login_form] do
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
  #   		Below, here's how Kyle applied this in the admissions officers controller
  #   		if admin_user && admin_user.authenticate(params['password'])
		# 	session[:user_name] = admin_user.email
		# 	@admin = session[:user_name]

		# 	cookies[:username] = admin_user.email
		# 	cookies[:age_example] = {:value => "Expires in 10 seconds", :expires => Time.now + 10}

		# 	render :index
		# else
		# 	@error = true
		# 	render :index

    #

    #student actually would not be able to look at this page
	def index
	# 	if student_logged_in
	# 		render : 
	# 		#students cannot view a list of students. They wil be redirected back to their own dashboard
	# 	else
	# 		@students = Student.all
	# 	end
	end

	#student will not be able to search for other students, only look at their own page
	def show
		@student = Student.find(params[:id])
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

	def create
		Student.create(name: params[:name], email: params[:email], phone_number: params[:phone_number], password: params[:password], course: params[:course], application_essay: params[:application_essay], application_status: "Phone Interview Pending" )
    end
	# def create
	# 	@student = Student.create(params["student"].permit(:name, :email, :password, :course, :application_essay))
	# 	#student parameters which are not determined by student: id, application_status, admissions_officer_id, and instructor_id
	# 	if @student.save 
 #            redirect_to #student_dashboard
 #        else
 #            render 
 #            #students will be directed back to register page
 #        end
 #        #methods folded into this method: register for account, pick program, submit application, provide information
	# end

	# def edit
	# 	@student = Student.find(params[:id])
 #        if @student.save
 #        else
 #            render :edit
 #        end
	# end

	def update
		@student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to "students"
    end

    private

    def student_params 
		params.require(:student).permit(:name, :email, :phone_number, :password_digest, :course, :application_essay, :application_status, :admissions_officer_id, :instructor_id)
	end
	# def destroy
	# 	@student = Student.find(params[:id])
	# 	@student.destroy
	# 	redirect_to '/'
	# end

end
