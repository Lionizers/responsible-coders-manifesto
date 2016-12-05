# frozen_string_literal: true
class CreateCoders < ActiveRecord::Migration
  def change
    create_table :coders do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
