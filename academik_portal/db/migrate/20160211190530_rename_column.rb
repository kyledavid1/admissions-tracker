class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :students, :password, :password_digest
  end
end
