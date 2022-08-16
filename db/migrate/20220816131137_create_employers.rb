class CreateEmployers < ActiveRecord::Migration[7.0]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :industry
      t.integer :years_worked
      t.string :job_title
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
