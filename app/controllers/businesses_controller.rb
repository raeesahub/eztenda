class BusinessesController < ApplicationController
  def index
    if current_user.user_type == "bar"
      @businesses = current_user.business
    else
      @businesses = Business.all
    end
  end
end
