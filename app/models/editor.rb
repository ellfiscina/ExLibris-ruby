class Editor < ApplicationRecord
  QTT_PER_PAGE = 20

  has_many :books, dependent: :destroy

  scope :per_page, -> (page) {
    page(page).per(QTT_PER_PAGE)
  }
end
