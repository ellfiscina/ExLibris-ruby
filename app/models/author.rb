class Author < ApplicationRecord

  QTT_PER_PAGE = 20

  has_many :books, dependent: :destroy

  validates :name, presence: true
  validate :death_date_after_birth
  validate :birth_date_after_today, if: :birth_date_changed?

  scope :per_page, -> (page) {
    page(page).per(QTT_PER_PAGE)
  }

  def to_param
    "#{id} #{name}".parameterize
  end
end


  private

  def death_date_after_birth
    return unless death_date && birth_date && death_date < birth_date

    errors.add(:death_date, 'não pode ser menor que a data de nascimento')
  end

  def birth_date_after_today
    return unless birth_date > Date.today

    errors.add(:birth_date, 'não pode ser maior que a data de hoje')
  end
