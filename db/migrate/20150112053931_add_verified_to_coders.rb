class AddVerifiedToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :verified, :boolean
  end
end
