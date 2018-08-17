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

  def to_param
    "#{id} #{title}".parameterize
  end

  def percentage
    per = pages_read / pages.to_f
    per = 0 if per.nan?
    per.round(2)
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
