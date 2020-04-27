class User < ApplicationRecord    
validates :name, presence: true, length: { maximum: 50 }
validates :number, presence: true
has_many :purchases, foreign_key: :user_number
has_many :products, through: :purchases
belongs_to :salon
end