class Tender < ApplicationRecord
    has_many :bids
    belongs_to :business
    belongs_to :contract, optional: true

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :description, :active ],
    using: {
      tsearch: { prefix: true }
    }

end
