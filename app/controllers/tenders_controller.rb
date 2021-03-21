class TendersController < ApplicationController
  def index
    if current_user.user_type == "bar"
      @tender_arrray = Business.where(user_id: current_user.id).map(&:tenders).flatten
    else
      @tender_arrray =Tender.all
    end
    if params[:query].present?
      @tenders = @tender_arrray.search(params[:query])
    elsif params[:category].present?
      category_id = params[:category].to_i
      y = @tender_arrray.where(categories_id: category_id)
      @tenders = y
    else
      @tenders = @tender_arrray
    end
  end

  def show
    @tender = Tender.find(params[:id])
    @products = Product.where(user_id: current_user.id)
    @bids = Bid.new
  end

  def new
    @tender = Tender.new
    @business = Business.all
    @products = Product.where(user_id: current_user.id)
    @categories = Category.all
  end

  def create
    @tender = Tender.create!(strong_params)
    @tender.active = true
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
