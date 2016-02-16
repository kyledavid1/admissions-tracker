class InstructorQuestionnairesController < ApplicationController


	# def index
	# 	@iqs = InstructorQuestionnaire.all 
	# end

	def show
	end

	def new
		@iq = InstructorQuestionnaire.new
	end

	def create
		@student = Student.find(params[:student_id])
		@instructor = Instructor.find(session[:user_id])
		@iq = InstructorQuestionnaire.create(iq_params, instructor_id: session[:user_id], student_id: @student.id)
		@student.update_status(application_status: "Interviews Completed")
		redirect_to instructor_path(session[:user_id])
	end

	def edit
	end

	def update
		@iq = InstructorQuestionnaire.find(params[:id])
        @iq.update(iq_params)
        redirect_to "/instructor_questionnaires"
    end

	def iq_params
        params.require(:instructor_questionnaire).permit(:strengths, :weaknesses, :comments)
	end
		

end

