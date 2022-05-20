# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:article) { create(:article, user:) }
  let(:comment) do
    build(:comment, { commenter:, body:, user:, status:, article:, stars: })
  end
  let(:commenter) { 'John plpl' }
  let(:body) { 'I see a lot of considerations there' }
  let(:status) { 'public' }
  let(:stars) { 4.4 }

  context 'when valid' do
    it 'is valid' do
      expect(comment.valid?).to be(true)
    end
  end

  context 'when there is no user_id' do
    let(:user) { nil }
    let(:article) { create(:article) }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when there is no article_id' do
    let(:article) { nil }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when there is no commenter' do
    let(:commenter) { nil }

    it 'is valid' do
      expect(comment.valid?).to be(true)
    end
  end

  context 'when there is no body' do
    let(:body) { nil }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when there is no status' do
    let(:status) { nil }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when there is no stars' do
    let(:stars) { nil }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when stars is not a float' do
    let(:stars) { 'ekaj' }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when stars is superior to 5' do
    let(:stars) { 6.0 }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when stars is inferior to 0' do
    let(:stars) { -1.0 }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when body is less than 10 chars' do
    let(:body) { 'a' * 9 }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context 'when body is more than 1000 chars' do
    let(:body) { 'a' * 1002 }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end

  context "when status is not 'public' or 'private' or 'closed'" do
    let(:status) { 'ekaj' }

    it 'is invalid' do
      expect(comment.invalid?).to be(true)
    end
  end
end
