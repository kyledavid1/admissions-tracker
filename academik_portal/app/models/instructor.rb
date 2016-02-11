class Instructor < ActiveRecord::Base
    has_many :instructor_questionnaires
    has_many :students
end