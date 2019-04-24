# frozen_string_literal: true

require 'test_helper'
require 'pry'

describe UsersController do
  let(:user) { users(:one) }
  let(:media) { Work.create(title: 'test work', media: 'album', created_by: 'your mom') }
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  # describe 'login' do
  #   it 'successfully logs in a user' do
  #     user_params = {
  #       user: {
  #         username: 'ari'
  #       }
  #     }
  #     post login_path, params: user_params
  #     must_respond_with :redirect

  #     expect(user.valid?).must_equal true
  #     puts user.username
  #   end
  # end

  # describe "current" do

  #   it "directs a user to their details page" do 
  #     user = User.create(username: "test")
  #     get current_user_path

  #     must_respond_with :redirect
  #   end

  #   it "raises an error if there is no current user (no one is logged in)" do
  #     get current_user_path


  #     must_respond_with :error
  #   end
  # end

  describe 'vote' do
    #   it 'must get found response from vote action' do
    #     post vote_path(media.id)
    #     must_respond_with :found
    #   end

    #   it 'adds an upvote to a Work record' do
    #     post vote_path(media.id)
    #     # binding.pry

    #     expect(media.cached_votes_total).must_equal 1
    #   end

    # a guest user cannot vote unless they're logged in
    it 'prohibits a guest user from voting until they have logged in' do
    end
  end
end
