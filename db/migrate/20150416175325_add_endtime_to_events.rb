class AddEndtimeToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :end_time, :string
  end
end
