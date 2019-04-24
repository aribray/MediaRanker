# frozen_string_literal: true

require 'pry'
class Work < ApplicationRecord
  validates :title, presence: true

  acts_as_votable
  # has_many :votes

  def self.top_ten(media)
    # raise
    results = Work.where(media: media.to_s).where.not(cached_votes_total: 0).order(cached_votes_total: :desc).order(title: :asc)

    results = Work.where(media: media.to_s) if results.empty?

    if results.length <= 10
      return results
      # .order(cached_votes_total: :desc).order(title: :asc)
    else
      results = results[0..9]
    end

    results
    # .order(cached_votes_total: :desc).order(title: :asc)
  end

  def self.spotlight
    spotlight = Work.order(cached_votes_total: :desc).first

    # could add alphabetical order here
    # .order(title: :asc)

    spotlight
  end
end
