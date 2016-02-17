class InstructorQuestionnairesController < ApplicationController

	def index
		@student = Student.find(params[:student_id])
		@iq = InstructorQuestionnaire.find_by(student_id: @student.id)		
	end

	def show
		@student = Student.find(params[:instructor_questionnaire][:student_id])
		@iq = InstructorQuestionnaire.find(params[:id])
	end

	def new
		@student = Student.find(params[:student_id])
		@iq = InstructorQuestionnaire.new
	end

	def create
		@student = Student.find(params[:instructor_questionnaire][:student_id])
		@iq = InstructorQuestionnaire.create(iq_params)
		@instructor = Instructor.find(session[:user_id])
		@student.update_attributes(application_status: "Interviews Completed")
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
        params.require(:instructor_questionnaire).permit(:strengths, :weaknesses, :comments, :instructor_id, :student_id)
	end
		

end

