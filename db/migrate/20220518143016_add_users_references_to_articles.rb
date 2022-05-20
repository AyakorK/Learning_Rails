# frozen_string_literal: true

# Add user references to articles
class AddUsersReferencesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user, null: false, foreign_key: true
  end
end
