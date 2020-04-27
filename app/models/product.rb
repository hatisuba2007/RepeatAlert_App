class Product < ApplicationRecord
validates :brand, presence: true
validates :number, presence: true
validates :name, presence: true
validates :term, presence: true
has_many :purchases, foreign_key: :product_number
has_many :users, through: :purchases
belongs_to :salon
end