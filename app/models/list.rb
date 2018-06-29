class List < ApplicationRecord
  QTT_PER_PAGE = 10

  has_and_belongs_to_many :books

  scope :per_page, -> (page) { page(page).per(QTT_PER_PAGE) }

  validates :year, uniqueness: true
end
