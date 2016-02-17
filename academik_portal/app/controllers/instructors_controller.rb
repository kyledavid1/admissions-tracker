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

  def logout 
    session.delete('user_id')
    redirect_to '/'
  end

  def index
  	@instructors = Instructor.all
    render :instructors
  end

  def show  
    @instructor = Instructor.find(params[:id])
    @students = Student.where(application_status: 'In-Person Interview Pending')
    @students_scheduled = Student.where(application_status: 'In-Person Interview Scheduled', instructor_id: params[:id])
    @students_interviewed = Student.where(application_status: 'Interviews Completed', instructor_id: params[:id])
    # @iq = InstructorQuestionnaire.find(instructor_id: @instructor.id)
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create(instructor_params)
    if @instructor.save
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def instructor_params
    params.require(:instructor).permit(:name, :email, :password, :course)
  end

  private

  def authorized?
    !current_user.nil? || current_user.is_a?(Instructor)
  end

end