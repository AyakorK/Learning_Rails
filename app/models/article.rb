# frozen_string_literal: true

# Article class
class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }
  validates :status, presence: true, inclusion: { in: %w[public private closed] }

  scope :open, -> { where.not(status: 'closed') }

  def self.open_count
    open.count
  end
end
