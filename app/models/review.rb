class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates_inclusion_of :rate, in: 1..5
end
