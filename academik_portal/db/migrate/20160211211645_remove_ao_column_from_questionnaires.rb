class RemoveAoColumnFromQuestionnaires < ActiveRecord::Migration
  def change
  	remove_column :ao_questionnaires, :admissions_officer_id, :integer
  end
end
