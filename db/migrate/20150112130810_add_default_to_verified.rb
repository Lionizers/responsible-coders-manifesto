# frozen_string_literal: true

class AddDefaultToVerified < ActiveRecord::Migration
  def change
    change_column :coders, :verified, :boolean, default: false
  end
end
