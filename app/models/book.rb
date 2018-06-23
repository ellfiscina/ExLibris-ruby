class Book < ApplicationRecord
  QTT_PER_PAGE = 12

  belongs_to :editor, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :author, counter_cache: true

  scope :per_page, -> (page) {
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  }
  scope :title_pages, -> (value) {
    select(:title).where(pages: value).pluck(:title)
  }
  scope :title_age, -> (value) {
    select(:title).where(year: value).pluck(:title)
  }
  scope :sel_status, -> (value) {
    select(:title).where(status: value).pluck(:title)
  }
  scope :sel_shelf, -> (value) {
    select(:title).where(shelf: value).pluck(:title)
  }
  scope :max_value, -> (q) { maximum(q) }
  scope :min_value, -> (q) { minimum(q) }
  scope :count_status, -> (value) { where(status: value).count }

  # status
  # 1 - Lido
  # 2 - Lendo
  # 3 - Ler
  # shelf
  # 1 - Sim
  # 0 - Não
end
