class InstructorsController < ApplicationController

  def login
    admin_user = Instructor.find_by(email: params['email'])
    if admin_user && admin_user.authenticate(params['password'])
      session[:user_name] = admin_user.name
      @name = sessions[:user_name]

      cookies[:name] = instructor.name
      cookies[:age_example] = {:value => "I expire in 10 seconds", :expires => Time.now + 10}
      render :index
    else
      @error = true
      render :index  
    end  
  end

  def index
  	@students = Student.where(application_status: 'In-Person Interview')
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    if @student.save
      redirect_to student_path(student.id)
    else
      render :edit
    end
  end

  def update
    @student = Student.find(params[:id])
  end

  def student
  end

end