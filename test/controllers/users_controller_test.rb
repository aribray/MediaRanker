# frozen_string_literal: true

require 'test_helper'
require 'pry'

describe UsersController do
  # let(:media) { Work.create(title: 'test work') }

  describe 'login' do
    it 'successfully logs in a user' do
      login_as
      user = User.last
      must_respond_with :redirect

      expect(session[:user_id]).must_equal user.id
      expect(user.valid?).must_equal true
    end
  end

  describe 'current' do
    it 'returns 200 OK for logged in user' do
      login_as

      get current_user_path

      must_respond_with :success
    end

    it 'raises an error if there is no current user (no one is logged in)' do
      get current_user_path

      expect(flash[:error]).must_equal 'You must be logged in to see this page'
      must_respond_with :redirect
    end
  end

  describe 'vote' do
    # it 'must change cached_votes_total of the work' do
    #   login_as
    #   media = Work.create(title: 'new work')
    #   post vote_path(media.id)

    #   must_respond_with :found

    #   expect(media.cached_votes_total).must_equal 1
    # end

    # a guest user cannot vote unless they're logged in
    it 'prohibits a guest user from voting until they have logged in' do
      media = Work.create(title: 'new work')

      post vote_path(media.id)

      expect(flash[:error]).must_equal 'You must log in before voting!'
      must_respond_with :redirect
    end

    it 'prohibits a user from voting for a Work if they have already voted for it' do
    end
  end
end
