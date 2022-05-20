# frozen_string_literal: true

# add status to comments
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
