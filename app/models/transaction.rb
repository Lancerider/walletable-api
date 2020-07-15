class Transaction < ApplicationRecord
  belongs_to :account
  validates_presence_of :date, :category, :description, :amount
  validates_numericality_of :amount, :on => :create
end