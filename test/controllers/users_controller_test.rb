# frozen_string_literal: true

require 'test_helper'

describe UsersController do
  let(:user) { users(:one) }
  let(:media) { Work.create(title: 'test work', media: 'album', created_by: 'your mom') }
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end

  describe 'vote' do
    it 'must add votes to the upvote field' do
      post vote_path

    binding.pry
    end
  end
end
