class RemoveGoodFitFromInstructorQuestionnaires < ActiveRecord::Migration
  def change
    remove_column :instructor_questionnaires, :good_fit, :boolean
  end
end
