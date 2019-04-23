# frozen_string_literal: true

require 'pry'
class Work < ApplicationRecord
  validates :title, presence: true

  def self.top_ten(media)
    results = Work.where(media: media.to_s)
    results = results.where.not(upvotes: 0)
    results = results.order(upvotes: :desc)

    if results.length <= 10
      return results
    else
      results = results[0..9]
    end

    results
    # binding.pry
  end
end
