class RemoveAoKeyFromQuestionnaires < ActiveRecord::Migration
  def change
  	remove_foreign_key :ao_questionnaires, column: :admissions_officer_id
  end
end
