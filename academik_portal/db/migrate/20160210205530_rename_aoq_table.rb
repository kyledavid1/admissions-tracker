class RenameAoqTable < ActiveRecord::Migration
  def change
  	rename_table :admissions_officers_questionnaires, :ao_questionnaires
  end
end
