class CreateCandidateSearchParameters < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_search_parameters do |t|
      t.boolean :employment_status
      t.string :city
      t.string :country
      t.text :employment_history
      t.text :educational_background
      t.text :programming_languages
      t.text :web_frameworks
      t.text :other_technologies
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
