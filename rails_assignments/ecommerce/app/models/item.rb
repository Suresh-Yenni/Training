class Item < ApplicationRecord

  validates :item_name, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :price, presence: true, numericality: true
  has_many :orders, dependent: :destroy

  scope :item_on_id, -> (id)  { Item.find(id)}

end
