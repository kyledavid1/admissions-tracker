class AddAdmissionsOfficersIdToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :admissions_officers_id, :integer
  end
end
