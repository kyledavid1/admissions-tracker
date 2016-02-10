class AddInstructorRefToInstructorsQuestionnaires < ActiveRecord::Migration
  def change
    add_reference :instructors_questionnaires, :instructor, index: true, foreign_key: true
  end
end
