class Author < ApplicationRecord
  QTT_PER_PAGE = 50

  has_many :books, dependent: :destroy

  scope :per_page, -> (page) {
    order(:name).page(page).per(QTT_PER_PAGE)
  }
end
