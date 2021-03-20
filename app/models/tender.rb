class Tender < ApplicationRecord
    has_many :bids
    belongs_to :buisness
end
