class CreateSocialMediaProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :social_media_profiles do |t|
      t.string :name_of_platform
      t.string :social_media_handle
      t.string :url
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
