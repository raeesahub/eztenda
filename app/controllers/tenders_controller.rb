class TendersController < ApplicationController
  def index
    if params[:query].present?
      @tenders = Tender.search(params[:query])
    else
      @tenders = Tender.all
    end
  end

  def show
    @tender = Tender.find(params[:id])
  end
end
