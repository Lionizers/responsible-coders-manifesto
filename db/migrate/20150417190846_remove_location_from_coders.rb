class RemoveLocationFromCoders < ActiveRecord::Migration
  def change
    remove_column :coders, :location, :string
  end
end
