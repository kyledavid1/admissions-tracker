class AddAdmissionOfficerRefToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :admission_officer, index: true, foreign_key: true
  end
end
