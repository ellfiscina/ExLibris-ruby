class Author < ApplicationRecord
  QTT_PER_PAGE = 50

  has_many :books

  scope :per_page, -> (page) {
    order(:name).page(page).per(QTT_PER_PAGE)
  }
end
