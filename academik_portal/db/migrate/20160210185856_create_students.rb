class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :course
      t.text :application_essay
      t.string :application_status
    end
  end
end
