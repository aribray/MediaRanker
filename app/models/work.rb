# frozen_string_literal: true

class Work < ApplicationRecord
  validates :title, presence: true

  # def top_ten
  #   result = Work.group_by do |work|
  #     work[:upvotes]
  #   end
  #   top_10 = []

  #   if result.length <= 10
  #     return result
  #   else
  #     10.times do |i|
  #       top_10 << result[i]
  #     end
  #   end

  #   top_10
  # end
end
