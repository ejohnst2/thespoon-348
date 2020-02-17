class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  def show
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end

# code from Monday 17/2

  # def index
    # conditional to see if there was any input for the filter
    # if params[:food_type].present?
    #   @category = params[:food_type]
    #   @restaurants = RESTAURANTS.select { |id, r| r[:category] == @category }
    # else
      # @restaurants = Restaurant.all
    # end
  # end

  # def show
    # @restaurant = RESTAURANTS[params[:id].to_i]
  # end

  # def create
  #   render plain: "Just created a new resto: #{params[:name]} at #{params[:address]}"
  # end
