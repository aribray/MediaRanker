# frozen_string_literal: true

require 'test_helper'

describe Work do
  let(:album) { works(:album) }

  it 'must be valid' do
    value(album).must_be :valid?
  end

  describe 'validations' do
    it 'requires a title' do
      # Arrange
      album.title = nil

      # Act
      valid_work = album.valid?

      # Assert
      expect(valid_work).must_equal false
      expect(album.errors.messages).must_include :title
      expect(album.errors.messages[:title]).must_equal ["can't be blank"]
    end
  end

  describe 'top_10 method' do
    results = Work.top_ten('album')
    it 'can pick the top 10 most upvoted works' do
      expect(results.length).must_equal 1
    end

    it "can return only works that have upvotes" do 
      expect(results).wont_include works(:album_two)
    end
  end
end # end of describe Work block
