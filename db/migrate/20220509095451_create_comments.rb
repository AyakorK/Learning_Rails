# frozen_string_literal: true

# Method to create the table for comments
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.float :stars
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
