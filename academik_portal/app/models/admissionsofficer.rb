class AdmissionOfficer < ActiveRecord::Base
	has_many :ao_questionnaires
	has_many :students
end