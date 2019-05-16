class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.text :description
      t.string :avatar
      t.belongs_to :billboard, foreign_key: true

      t.timestamps
    end
  end
end
