class User < ApplicationRecord
  has_secure_password
  has_many :accounts

  #Validations
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_presence_of :first_name, :last_name, :phone
  validates :password, :presence => true,
                       :length => {:within => 6..40},
                       :on => :create
end