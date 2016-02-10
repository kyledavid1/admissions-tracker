class StudentsController <ApplicationController

    #student actually would not be able to look at this page
	def index
		@students = Student.all
	end

	#student will not be able to search for other students, only look at their own page
	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.create(params["student"].permit(:name, :email, :password, :course, :application_essay))
		#student parameters which are not determined by student: id, application_status, admissions_officer_id, and instructor_id
		if @student.save 
            redirect_to #student_dashboard
        else
            render #register page
        end
	end

	def edit
		@student = Student.find(params[:id])
        if @student.save
        else
            render :edit
        end
	end

	def update
		@student = Student.find(params[:id])
        @student.update(name: params["student"]["name"], email: params["student"]["email"], password: params["student"]["password"], course: params["student"]["course"], application_essay["student"]["application_essay"])
        redirect_to band_path
    end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy
		redirect_to '/'
	end

end
