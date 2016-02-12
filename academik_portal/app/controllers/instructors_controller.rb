class InstructorsController < ApplicationController

  # before_action except: [:login, :login_form] do
  #   if current_user.nil? || (current_user.is_a?(Instructor) && params[:id].to_i != current_user.id)
  #     redirect_to 'instructors/login_form'
  #   end
  # end

  def login
    instructor_user = Instructor.find_by(email: params['email'])
    
    if instructor_user && instructor_user.authenticate(params['password'])
      session[:user_type] = 'Instructor'
      session[:user_id] = instructor_user.id
      @instructor = session[:email]

      cookies[:email] = instructor_user.email
      redirect_to instructor_user
    else
      @error = true
      render :login_form 
    end  
  end

  # def index
  # 	@students = Student.where(application_status: 'In-Person Interview')
  # end

  def show  
    @instructor = Instructor.find(params[:id])
    @students = Student.where(application_status: 'In-Person Interview')
  end

  def create
  end

  def edit
  end

  # def update
  #   @student = Student.find(params[:id])
  # end

  # def student
  # end

end