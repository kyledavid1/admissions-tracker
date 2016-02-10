class AddStudentRefToAoQuestionnaires < ActiveRecord::Migration
  def change
    add_reference :ao_questionnaires, :student, index: true, foreign_key: true
  end
end
