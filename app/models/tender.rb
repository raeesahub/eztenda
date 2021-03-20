class Tender < ApplicationRecord
    has_many :bids
    belongs_to :business


  # def duration
  #   @duration = (self.end_time.to_i - self.start_time.to_i)
  # end

end
