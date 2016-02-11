class RenameAdmissionsOfficersTable < ActiveRecord::Migration
  def change
  	rename_table :admissions_officers, :admission_officers
  end
end
