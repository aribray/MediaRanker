# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true
  # , uniqueness: true

  has_many :votes
  has_many :works, through: :votes
end
