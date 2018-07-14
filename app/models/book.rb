class Book < ApplicationRecord
  QTT_PER_PAGE = 16

  belongs_to :editor, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :author, counter_cache: true

  has_and_belongs_to_many :lists

  has_one_attached :image


  validates :title, presence: true
  validates :isbn, uniqueness: {allow_blank: true}

  scope :per_page, -> (page) {
    page(page).per(QTT_PER_PAGE)
  }
  scope :title_pages, -> (value) {
    select(:title).where(pages: value).pluck(:title)
  }
  scope :title_age, -> (value) {
    select(:title).where(published: value).pluck(:title)
  }
  scope :per_status, -> (value, page, sort) {
    where(status: value).order(params[:sort]).page(page).per(QTT_PER_PAGE)
  }
  scope :per_shelf, -> (value, page) {
    where(shelf: value).order(params[:sort]).page(page).per(QTT_PER_PAGE)
  }
  scope :search, -> (q, page) {
    where("lower(title) LIKE ?", "%#{q.downcase}%").page(page).per(QTT_PER_PAGE)
  }
  scope :max_value, -> (q) { where.not(shelf: 2).maximum(q) }
  scope :min_value, -> (q) { where.not(shelf: 2).minimum(q) }
  scope :count_status, -> (value) { where(status: value).count }
  scope :count_author, -> (value) { where(author_id: value).count }
  scope :count_editor, -> (value) { where(editor_id: value).count }

  def to_param
    "#{id} #{title}".parameterize
  end
  # status
  # 1 - Lido
  # 2 - Lendo
  # 3 - Ler
  # shelf
  # 1 - Sim
  # 2 - Não
  # 3 - Quero
end
