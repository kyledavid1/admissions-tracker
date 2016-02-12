class ChangeDefaultOfApplicationStatus < ActiveRecord::Migration
  def change
  	change_column :students, :application_status, :string, :default => 'Phone Interview Pending'
  end
end
