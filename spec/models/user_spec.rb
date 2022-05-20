# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  let(:user) do
    build(:user, email:, password:, password_confirmation:)
  end
  let(:email) { 'putin@example.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { password }

  describe 'validations' do
    context 'when all attributes are valid' do
      it 'is valid' do
        expect(user.valid?).to be(true)
      end
    end

    context 'when email is nil' do
      let(:email) { nil }

      it 'is not valid without an email' do
        expect(user.valid?).to be(false)
      end
    end

    context 'when password is nil' do
      let(:password) { nil }

      it 'is not valid without a password' do
        expect(user.valid?).to be(false)
      end
    end

    context 'when password_confirmation is nil' do
      let(:password_confirmation) { nil }

      it 'is not valid' do
        expect(user.valid?).to be(false)
      end
    end

    context 'when password is not equal to password_confirmation' do
      let(:password_confirmation) { 'password2' }

      it 'is not valid' do
        expect(user.valid?).to be(false)
      end
    end

    context 'when password is not 6 characters long' do
      let(:password) { 'pass' }

      it 'is not valid' do
        expect(user.valid?).to be(false)
      end
    end
  end
end
