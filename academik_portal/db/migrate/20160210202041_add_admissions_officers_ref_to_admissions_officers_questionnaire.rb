class AddAdmissionsOfficersRefToAdmissionsOfficersQuestionnaire < ActiveRecord::Migration
  def change
    add_reference :admissions_officers_questionnaires, :admissions_officer, index: true, foreign_key: true
  end
end
