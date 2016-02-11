class RenameColummInInstructors < ActiveRecord::Migration
  def change
  	rename_column :instructors, :password, :password_digest
  end
end
