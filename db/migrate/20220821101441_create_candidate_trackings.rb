class CreateCandidateTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_trackings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
