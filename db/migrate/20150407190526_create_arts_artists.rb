class CreateArtsArtists < ActiveRecord::Migration
  def change
    create_table :artists_arts do |t|
    	t.belongs_to :art, index: true
      	t.belongs_to :artist, index: true
    end
  end
end
