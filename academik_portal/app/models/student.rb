class Student < ActiveRecord::Base
	belongs_to :admission_officer
	belongs_to :instructor
end