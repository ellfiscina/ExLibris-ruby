class List < ApplicationRecord
  belongs_to :book

  scope :order_uniq, -> (year) { order(year).distinct.pluck(year) }
end
