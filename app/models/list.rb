class List < ApplicationRecord
  QTT_PER_PAGE = 10

  belongs_to :book

  scope :order_uniq, -> (year) { order(year).distinct.pluck(year) }
  scope :per_page, -> (page) { page(page).per(QTT_PER_PAGE) }
  scope :count_books, -> (year) { group(year).count(year) }
  scope :count_pages, -> (year) { includes(:book).where(year: year).sum(:pages) }

end
