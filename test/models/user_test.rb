# frozen_string_literal: true

require 'test_helper'

describe User do
  let(:user) { users(:one) }
  let(:media) { works(:book) }

  describe 'validations' do
    it 'must be valid' do
      value(user).must_be :valid?
    end

    it 'must have a username to be valid' do
      user.username = nil

      # Act
      valid_user = user.valid?

      # Assert
      expect(valid_user).must_equal false
      expect(user.errors.messages).must_include :username
      expect(user.errors.messages[:username]).must_equal ["can't be blank"]
    end
  end

  describe 'relationships' do
    it 'can vote for a Work' do
      user.up_votes media

      expect(user.voted_for?(media)).must_equal true
    end
  end

  # it 'must have a unique username' do
  #   user = User.create(username: 'MyString')

  #   expect(user.save).must_equal false
  # end
end
