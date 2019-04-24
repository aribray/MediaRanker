# frozen_string_literal: true

require 'test_helper'
require 'pry'

describe UsersController do
  let(:user) { users(:one) }
  let(:media) { Work.create(title: 'test work', media: 'album', created_by: 'your mom') }
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  # describe 'vote' do
  #   it 'must get found response from vote action' do
  #     post vote_path(media.id)
  #     must_respond_with :found
  #   end

  #   it 'adds an upvote to a Work record' do
  #     post vote_path(media.id)
  #     # binding.pry

  #     expect(media.cached_votes_total).must_equal 1
  #   end
  # end
end
