class RenameColumnInCandidates < ActiveRecord::Migration[7.0]
  def change
    rename_column :candidates, :employer, :current_employer
  end
end
