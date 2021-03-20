class TendersController < ApplicationController
  def index
    if params[:query].present?
      @tenders = Tender.search(params[:query])
    elsif params[:category].present?
      category_id = params[:category].to_i
      y = Tender.where(categories_id: category_id)
      @tenders = y
    else
      @tenders = Tender.all
    end
  end

  def show
    @tender = Tender.find(params[:id])
    @bids = Bid.new
  end
end
