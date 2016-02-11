class RenameColumnInAdmissionsOfficers < ActiveRecord::Migration
  def change
  	rename_column :admissions_officers, :password, :password_digest
  end
end
