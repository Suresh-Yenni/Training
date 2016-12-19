class College < ApplicationRecord
    validates :establish, presence: true, numericality: { only_integer: true}
    validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/ }
    has_many :students, dependent: :destroy
end
