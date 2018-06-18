class Book < ApplicationRecord
  belongs_to :editor
  has_and_belongs_to_many :authors
end
