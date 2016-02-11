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

	def aoq_params
        params.require(:)
		
	end


end