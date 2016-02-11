class RemoveAoColumnFromStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :admissions_officer_id, :integer
  end
end
