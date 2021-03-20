class TendersController < ApplicationController
  def index
    @tenders = Tender.all
  end
  
  def show
    @tender = Tender.find(params[:id])
  end
end
