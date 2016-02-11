class RemoveAoKeyFromStudents < ActiveRecord::Migration
  def change
  	remove_foreign_key :students, column: :admissions_officer_id
  end
end
