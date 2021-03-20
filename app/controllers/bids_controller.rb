class BidsController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @bids = Bid.where(user_id: @user.id)
        return @bids
    end

    def offers
        @tenders = Business.where(user_id: current_user.id).map(&:tenders).flatten
    end
end
