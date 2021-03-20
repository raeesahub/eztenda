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

  def new
    @tender = Tender.new
    @business = Business.all
    @categories = Category.all
  end

  def create
    @tender = Tender.create!(strong_params)
    if @tender.save
      redirect_to tender_path(@tender)
    else
      render "new"
    end
  end

private

  def strong_params
  params.require(:tender).permit(:description, :min_bid, :start_date, :end_date, :volume, :active, :business_id, :categories_id)
  end
end
