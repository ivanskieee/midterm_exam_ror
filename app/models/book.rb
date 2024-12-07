class Book < ApplicationRecord
  belongs_to :author
  has_many :borrowings, dependent: :destroy
  has_many :borrowers, through: :borrowings
  validates :title, presence: true
  validates :published_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }
end
