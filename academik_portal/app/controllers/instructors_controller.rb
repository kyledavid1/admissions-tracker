class InstructorsController < ApplicationController

  before_action except: [:login, :login_form] do
    redirect_to instructors_login_form_path unless authorized?
  end

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

  def index
  	@instructors = Instructor.all
    render :instructors
  end

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

  private

  def authorized?
    !current_user.nil? || current_user.is_a?(Instructor)
  end

end