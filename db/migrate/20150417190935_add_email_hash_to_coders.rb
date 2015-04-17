class AddEmailHashToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :email_hash, :string
  end
end
