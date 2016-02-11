class AoQuestionnaire < ActiveRecord::Base
	belongs_to :admission_officer
	belongs_to :student
end