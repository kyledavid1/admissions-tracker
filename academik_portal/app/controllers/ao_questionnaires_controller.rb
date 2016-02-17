class AoQuestionnairesController < ApplicationController

	def index
		@student = Student.find(params[:student_id])
		@ao_questionnaire = AoQuestionnaire.find_by(student_id: @student.id)		
	end

	def show
		@student = Student.find(params[:ao_questionnaire][:student_id])
		@ao_questionnaire = AoQuestionnaire.find(params[:id])
	end

	def new
		@student = Student.find(params[:student_id])
		@ao_questionnaire = AoQuestionnaire.new
	end

	def create
		@student = Student.find(params[:ao_questionnaire][:student_id])
		@ao_questionnaire = AoQuestionnaire.create(ao_questionnaire_params)
		@admin_officer = AdmissionOfficer.find(session[:user_id])
		@student.update_attributes(application_status: "In-Person Interview Pending")
		redirect_to admission_officer_path(session[:user_id])
	end

	def edit

	end

	def update
		@ao_questionnaire = AoQuestionnaire.find(params[:id])
        @ao_questionnaire.update(ao_questionnaire_params)
        redirect_to "/ao_questionnaires"
    end

	def ao_questionnaire_params
        params.require(:ao_questionnaire).permit(:course_goals, :comments, :reason_for_applying, :admission_officer_id, :student_id)
	end
		

end



# .create(name: params[:name], email: params[:email])