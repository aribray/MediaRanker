# frozen_string_literal: true

require 'test_helper'

describe Work do
  let(:work) { works(:album) }

  it 'must be valid' do
    value(work).must_be :valid?
  end

  describe 'validations' do
    it 'requires a title' do
      # Arrange
      work.title = nil

      # Act
      valid_work = work.valid?

      # Assert
      expect(valid_work).must_equal false
      expect(work.errors.messages).must_include :title
      expect(work.errors.messages[:title]).must_equal ["can't be blank"]
    end
  end

  describe 'top_10 method' do
  end
end # end of describe Work block
