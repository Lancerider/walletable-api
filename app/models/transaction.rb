# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account
  enum category: %i[food_and_drinks shopping services transport income others housing]

  validates_presence_of :date, :category, :amount, :payee
  validates_numericality_of :amount
  # validates :category, inclusion: { in: %w(food_and_drinks shopping services transport income others) }
end
