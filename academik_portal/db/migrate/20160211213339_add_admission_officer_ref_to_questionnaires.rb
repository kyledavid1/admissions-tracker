class AddAdmissionOfficerRefToQuestionnaires < ActiveRecord::Migration
  def change
    add_reference :ao_questionnaires, :admission_officer, index: true, foreign_key: true
  end
end
