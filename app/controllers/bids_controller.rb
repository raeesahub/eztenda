class BidsController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @bids = Bid.where(user_id: @user.id)
        return @bids
    end
end
