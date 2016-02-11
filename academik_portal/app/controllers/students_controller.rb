class StudentsController < ApplicationController

    #this page was last edited on 2/10/16

    def login
    	student = Student.find_by(:email, params['email'])

    	if user && user.authenticate(params['password'])
    		#if user exists and password is legit then...
    		session[:email] = student.email
    		@username = session[:email]

    		cookies[:email] = student.email
    		render :index
    	else
    		@error = true
    		render :index
    	end
    end

	def student_current_user
		#need code here to indicate that the person currently logged in is a student
	end	

    #
	def student_logged_in
		student_current_user
	end

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
	def student_params 
		params.require(:student).permit(:name, :email, :password, :course, :application_essay)
	end

	def update
		@student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to "students"
    end

	# def destroy
	# 	@student = Student.find(params[:id])
	# 	@student.destroy
	# 	redirect_to '/'
	# end

end
