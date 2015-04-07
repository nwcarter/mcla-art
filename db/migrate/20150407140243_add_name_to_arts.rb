class AddNameToArts < ActiveRecord::Migration
  def change
    add_column :arts, :name, :string
  end
end
