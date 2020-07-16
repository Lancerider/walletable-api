class Transaction < ApplicationRecord
  belongs_to :account
  validates_presence_of :date, :category, :amount, :payee, :account_id
  validates_numericality_of :amount
  enum category: [:food_and_drinks,:shopping,:services,:transport,:income,:others]
end