class Book < ApplicationRecord
  QTT_PER_PAGE = 12

  belongs_to :editor, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :author, counter_cache: true

  scope :per_page, -> (page) {
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  }
end
