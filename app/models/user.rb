# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true
  # , uniqueness: true
  acts_as_voter
end