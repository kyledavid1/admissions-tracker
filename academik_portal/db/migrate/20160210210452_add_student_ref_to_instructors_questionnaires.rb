class AddStudentRefToInstructorsQuestionnaires < ActiveRecord::Migration
  def change
    add_reference :instructors_questionnaires, :student, index: true, foreign_key: true
  end
end
