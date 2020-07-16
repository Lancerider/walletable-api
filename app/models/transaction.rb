class Transaction < ApplicationRecord
  belongs_to :account
  validates_presence_of :date, :category, :amount, :payee
  validates_numericality_of :amount, :on => :create
end