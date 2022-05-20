# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :user, presence: true
  validates :article, presence: true
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :stars, presence: true, numericality: { only_floats: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message: 'must be a number between 0 and 5' }
  validates :status, presence: true, inclusion: { in: %w[public private deleted] }
end
