class ProductsController < ApplicationController
    def index
        @products = Product.where(user_id: current_user.id)

    end
    def show
        @product = Product.where(user_id: current_user.id).find(params[:id])
    end
end
