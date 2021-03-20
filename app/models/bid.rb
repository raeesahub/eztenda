class Bid < ApplicationRecord
    belongs_to :tender,foreign_key: "tender_id"
    belongs_to :product,foreign_key: "product_id"
    belongs_to :user, :through => :products
end
