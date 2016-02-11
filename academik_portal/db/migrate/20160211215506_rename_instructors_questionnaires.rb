class RenameInstructorsQuestionnaires < ActiveRecord::Migration
  def change
  	rename_table :instructors_questionnaires, :instructor_questionnaires
  end
end
