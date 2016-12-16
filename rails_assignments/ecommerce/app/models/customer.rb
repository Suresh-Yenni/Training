class Customer < ApplicationRecord

  validates :city, :name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true
  validates :pincode, presence: true, numericality: { only_integer: true}, format: { with: /\A[+-]?\d+\z/ }
  has_many :orders, dependent: :destroy

end
