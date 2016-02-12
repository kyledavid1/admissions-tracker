class AoQuestionnairesController < ApplicationController

	def index
		@ao_questionnaires = AoQuestionnaire.all 
	end

	def show
	end

	def new
		@ao_questionnaire = AoQuestionnaire.new
	end

	def edit
	end

	def create
		@ao_questionnaire = AoQuestionnaire.new(aoq_params)
	end

	def update
		@ao_questionnaire = AoQuestionnaire.find(params[:id])
        @ao_questionnaire.update(aoq_params)
        redirect_to "/ao_questionnaires"
    end

	def aoq_params
        params.require(:ao_questionnaire).permit(:course_goals, :comments, :reason_for_applying)
	end
		


end


# .create(name: params[:name], email: params[:email])