class RestaurantsController < ApplicationController
	before_action :find_params, only: [:show, :edit, :update, :destroy]
	def index
		@restaurants = Restaurant.search(params[:search])
	end
	def show
		@restaurant = Restaurant.find(find_params)
		@menu = Menu.new
		@item = Item.new

		@menus = Menu.where(restaurantId: params[:id]).order("orderInList ASC")
		@items = Item.all
	end

	def new
		@restaurant = Restaurant.new
		if !user_signed_in?
			redirect_to(:back)
		end
	end

	def create
		@restaurant = Restaurant.create(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_path, flash: { notice: "Data has been inserted" }
		end
	end

	def edit
		if !user_signed_in?
			redirect_to(:back)
		end
	end

	def update
		if @restaurant.update(restaurant_params)
			redirect_to restaurants_path, flash: { notice: "Data has been updated" }
		end
	end

	def destroy
		if user_signed_in?
			@restaurant = Restaurant.find(find_params)
			if @restaurant.destroy
				redirect_to restaurants_path
			end
		end
	end

	private
	def find_params
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurant_params
		params.require(:restaurant).permit(:name, :phone, :location, :city, :country, :minPrice, :isDelivery, :code, :avatar, :tags)
	end
end
