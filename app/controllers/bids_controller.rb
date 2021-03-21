class BidsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @bids = Bid.where(user_id: @user.id)
    return @bids
  end

  def new
    @tender = Tender.find(:id)
    @bids = Bid.new(tender_id: @tender.id)
  end

  def create
    @bid = Bid.new(bid_params)
    @tender = Tender.find(params[:tender_id])
    @user = User.find(current_user.id)
    @bid.tender = @tender
    @bid.user = @user
    if @bid.save
      redirect_to tender_path(@tender), notice: 'Your bid has been submitted.'
    else
      redirect_to tender_path(@tender), notice: 'Bidding has failed,please check your bid.'

    end
  end

  def offers
    @tenders = Business.where(user_id: current_user.id).map(&:tenders).flatten
  end

  def accept_bid
    @bid = Bid.find(params[:bid_id])
    @tender = Tender.find_by_id(params[:tender_id])
    if @tender.business.user_id == current_user.id
    @tender.active = false
    @tender.save
    @bid.confirmed = "accepted"
    Contract.create!(bid: @bid,tender: @tender)
    @bid.save
    @tender.bids.each do |b| 
      b.update(confirmed: "rejected" ) if b.confirmed == "pending"
    end
    redirect_to offers_path, notice: 'Bidding was accepted and a Contract was generated.'
    end
  end

  def reject_bid
    @bid = Bid.find(params[:bid_id])
    @tender = Tender.find_by_id(params[:tender_id])
    if @tender.business.user_id == current_user.id
    @bid.confirmed = "rejected"
    @bid.save
    redirect_to offers_path, notice: 'Bidding was rejected.'
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:description, :amount, :incentives,:product_id)
  end
end
