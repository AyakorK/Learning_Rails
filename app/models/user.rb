# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # Validate that password and password_confirmation are the same
  validates :password, confirmation: true

  has_many :articles
  has_many :comments
end
