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
  end

  def self.spotlight
    media = %w[movie album book].sample
    selected = Work.top_ten(media).sample

    if selected.nil?
      self.spotlight
    else
      return selected
    end
  end
end
