class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [:show, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_parms)
    if @restaurant.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
     @restaurant.destroy
     redirect_to restaurants_path
  end



  private

  def restaurant_parms
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
