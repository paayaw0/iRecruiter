class AddDefaultValueToRecruiterAttribute < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :recruiter 
    add_column :users, :recruiter, :boolean, default: false
  end
end
