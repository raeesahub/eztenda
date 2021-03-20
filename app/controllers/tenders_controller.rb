class TendersController < ApplicationController
  def index
    @tenders = Tender.all
  end
end
