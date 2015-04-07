class ArtsEvents < ActiveRecord::Migration
  def change
  	create_table :arts_events, id: false do |t|
      		t.belongs_to :event, index: true
      		t.belongs_to :art, index: true
      	end
  end
end
