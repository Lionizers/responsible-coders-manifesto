# frozen_string_literal: true
class AddTokenToCoders < ActiveRecord::Migration
  def change
    add_column :coders, :token, :string
    add_column :coders, :location, :string
  end
end
