class InstructorQuestionnairesController < ApplicationController


	def index
		@iqs = InstructorQuestionnaire.all 
	end

	def show
	end

	def new
		@iq = InstructorQuestionnaire.new
	end

	def edit
	end

	def create
		@iq = InstructorQuestionnaire.new(iq_params)
	end

	def update
		@iq = InstructorQuestionnaire.find(params[:id])
        @iq.update(iq_params)
        redirect_to "/instructor_questionnaires"
    end

	def iq_params
        params.require(:instructor_questionnaire).permit(:strengths, :weaknesses, :good_fit, :comments)
	end
		

end

