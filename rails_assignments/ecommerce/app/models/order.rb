class Order < ApplicationRecord

  validates :customer_id, :item_id, presence: true, numericality: { only_integer: true}, format: { with: /\A[+-]?\d+\z/ }
  belongs_to :customer
  belongs_to :item

end
