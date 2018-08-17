class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :per_page, -> (page) {
    page(page).per(50)
  }
end
