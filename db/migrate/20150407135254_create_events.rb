class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :about
      t.string :history

      t.timestamps null: false
    end
  end
end
