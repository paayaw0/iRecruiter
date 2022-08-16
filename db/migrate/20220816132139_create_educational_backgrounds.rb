class CreateEducationalBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :educational_backgrounds do |t|
      t.string :name_of_school
      t.string :qualification
      t.datetime :start_date
      t.datetime :end_date
      t.text :courses
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
