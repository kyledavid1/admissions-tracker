class AddAdmissionsOfficerRefToAoQuestionnaires < ActiveRecord::Migration
  def change
    add_reference :ao_questionnaires, :admissions_officer, index: true, foreign_key: true
  end
end
