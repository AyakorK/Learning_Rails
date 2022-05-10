class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { minimum: 5 }
  validates :stars, presence: true, numericality: { only_floats: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message: 'must be a number between 0 and 5' }

end
