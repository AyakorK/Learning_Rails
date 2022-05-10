class Article < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :author, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 300 }



end
