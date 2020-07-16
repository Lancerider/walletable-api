class User < ApplicationRecord
  has_secure_password
  has_many :accounts
  has_many :transactions, through: :accounts

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :first_name, :last_name, :phone
  validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates_uniqueness_of :email

end