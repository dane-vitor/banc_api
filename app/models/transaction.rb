class Transaction < ApplicationRecord
  belongs_to :customer
  validates :opening_balance, numericality: true
  validates :credit, numericality: true
  validates :debit, numericality: true
  validates :final_balance, numericality: true

  
end
