class Borrowing < ApplicationRecord
  belongs_to :borrower
  belongs_to :book

  validates :borrowed_on, presence: true
  validates :returned_on, presence: true, comparison: { greater_than: :borrowed_on }
end
