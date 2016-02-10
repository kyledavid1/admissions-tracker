class AddAdmissionsOfficersRefToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :admissions_officer, index: true, foreign_key: true
  end
end
