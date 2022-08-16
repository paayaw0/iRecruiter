class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :employment_status
      t.string :work_mode
      t.string :linkedin_profile
      t.string :github_profile
      t.string :personal_website
      t.string :current_location
      t.string :social_network_profiles
      t.string :hiring_status

      t.timestamps
    end
  end
end
