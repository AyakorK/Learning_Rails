# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  let(:user) { create(:user) }
  let(:article) do
    build(:article, title:, body:, status:, user:)
  end
  let(:title) { "I don't know" }
  let(:body) { 'I try to create an article as long as possible' }
  let(:status) { 'public' }

  describe 'validations' do
    context 'when title is nil' do
      let(:title) { nil }

      it 'is invalid' do
        expect(article.invalid?).to be(true)
      end
    end

    context 'when body is nil' do
      let(:body) { nil }

      it 'is invalid' do
        expect(article.invalid?).to be(true)
      end
    end

    context 'when status is nil' do
      let(:status) { nil }

      it 'is invalid' do
        expect(article.invalid?).to be(true)
      end
    end

    context 'when user is nil' do
      let(:user) { nil }

      it 'is invalid' do
        expect(article.invalid?).to be(true)
      end
    end

    context 'when status is not public private or closed' do
      let(:status) { 'hoge' }

      it 'is invalid' do
        expect(article.invalid?).to be(true)
      end
    end
  end
end
