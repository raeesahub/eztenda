class Contract < ApplicationRecord
    has_one :tender
    has_one :bid
end
