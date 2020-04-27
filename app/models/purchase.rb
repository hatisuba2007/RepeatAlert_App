class Purchase < ApplicationRecord
    belongs_to :user, optional: true, foreign_key: :user_number
    belongs_to :product, optional: true, foreign_key: :product_number
    belongs_to :salon
end
