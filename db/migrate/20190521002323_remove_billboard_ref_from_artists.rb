class RemoveBillboardRefFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_reference :artists, :billboard, foreign_key: true
  end
end
