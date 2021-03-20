class Bid < ApplicationRecord
    belongs_to :tender,foreign_key: "tender_id"
    belongs_to :product,foreign_key: "product_id",optional: true
    belongs_to :user
end
