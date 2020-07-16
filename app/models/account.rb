class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  #Validation
  validates :name, presence: true
  # Incluir saldo inicial -> 0! 
end