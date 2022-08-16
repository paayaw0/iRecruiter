class AddExtraColumnsToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :sex, :string 
    add_column :candidates, :years_of_experience, :integer
    add_column :candidates, :experience_level, :integer
  end
end
