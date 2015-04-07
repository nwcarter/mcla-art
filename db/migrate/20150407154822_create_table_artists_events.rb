class CreateTableArtistsEvents < ActiveRecord::Migration
    def change
  		create_table :artists_events, id: false do |t|
      		t.belongs_to :event, index: true
      		t.belongs_to :artist, index: true
    end
  end
end
