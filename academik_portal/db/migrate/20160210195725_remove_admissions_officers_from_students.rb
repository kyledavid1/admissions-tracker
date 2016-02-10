class RemoveAdmissionsOfficersFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :admissions_officers_id, :integer
  end
end
