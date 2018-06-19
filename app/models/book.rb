class Book < ApplicationRecord
  QTT_PER_PAGE = 12

  belongs_to :editor
  belongs_to :user
  has_and_belongs_to_many :authors

  scope :per_page, -> (page) {
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  }
end
