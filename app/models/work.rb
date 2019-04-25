# frozen_string_literal: true

class Work < ApplicationRecord
  validates :title, presence: true

  acts_as_votable

  def self.top_ten(media)
    results = Work.where(media: media.to_s).where.not(cached_votes_total: 0).order(cached_votes_total: :desc).order(title: :asc)

    results = Work.where(media: media.to_s) if results.empty?

    if results.length <= 10
      return results
    else
      results = results[0..9]
    end

    results
  end

  def self.spotlight
    spotlight = Work.order(cached_votes_total: :desc).first
    spotlight
  end
end
