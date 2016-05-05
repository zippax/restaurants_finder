class MenusController < ApplicationController	
	before_action :find_params, only: [:show, :edit, :update, :destroy]
  def new
    if !user_signed_in?
      redirect_to(:back)
    end
  	@menus = Menu.where(restaurantId: params[:restaurant_id]).where("created_at >= ?", Time.zone.now.beginning_of_day)
  	@menu = Menu.new

    if !params[:restaurant_id]
      redirect_to admin_index_path
    end
    @id = params[:id]
    @id = @restaurant_id
  end
  def create
  	@menu = Menu.create(menu_params)
  	if @menu.save
  		# redirect_to new_menu_path
      redirect_to(:back)
  	end
  end

  def edit
    if !user_signed_in?
      redirect_to(:back)
    end
  end

  def update
  	@menu = Menu.find(find_params)
  	if @menu.update(menu_params)
  		redirect_to controller: 'menus', action: 'new', restaurant_id: @menu.restaurantId
  	end
  end

  def destroy
    if user_signed_in?
    	@menu = Menu.find(find_params)
    	if @menu.destroy
        redirect_to controller: 'menus', action: 'new', restaurant_id: @menu.restaurantId
    	end
    end
  end

  private

  def find_params
  	@menu = Menu.find(params[:id])
  end

  def menu_params
  	params.require(:menu).permit(:name, :orderInList, :restaurantId)
  end
end
