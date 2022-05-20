# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :article do
    title { "I don't know" }
    body { 'I try to create an article as long as possible' }
    user { build(:user) }
    status { 'public' }
  end

  factory :comment do
    article { build(:article) }
    user { build(:user) }
    body { 'I see a lot of considerations there' }
    stars { 4.4 }
    status { 'public' }
    commenter { 'John plpl' }
  end
end
