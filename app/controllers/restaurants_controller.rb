class RestaurantsController < ApplicationController
  RESTAURANTS = {
    1 => { name: "Dishoom", address: "Shoreditch, London", category: "indian" },
    2 => { name: "Sushi Samba", address: "City, London", category: "japanese" }
  }

  def index
    # conditional to see if there was any input for the filter
    if params[:food_type].present?
      @category = params[:food_type]
      @restaurants = RESTAURANTS.select { |id, r| r[:category] == @category }
    else
      @restaurants = RESTAURANTS
    end
  end

  def create
    render plain: "Just created a new resto: #{params[:name]} at #{params[:address]}"
  end

  def show
    @restaurant = RESTAURANTS[params[:id].to_i]
    # @restaurant = RESTAURANTS.find { |id, r| id == params[:id].to_i }
  end
end
