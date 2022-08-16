class AddEmployerToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :employer, :string
  end
end
