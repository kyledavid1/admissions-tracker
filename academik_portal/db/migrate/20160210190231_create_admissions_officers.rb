class CreateAdmissionsOfficers < ActiveRecord::Migration
  def change
    create_table :admissions_officers do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end
end
