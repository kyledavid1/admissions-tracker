class Student < ActiveRecord::Base
	belongs_to :admission_officer
	belongs_to :instructor
	has_secure_password

	# after_save do
	# 	raise
	# end
end