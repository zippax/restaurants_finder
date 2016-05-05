class ItemsController < ApplicationController
before_action :find_params, only: [:show, :edit, :update, :destroy]
  def new
    if !user_signed_in?
      redirect_to(:back)
    end
  	@items = Item.where(menuId:params[:menu_id]).where("created_at >= ?", Time.zone.now.beginning_of_day)
  	@item = Item.new

    if !params[:restaurant_id] || !params[:menu_id]
      redirect_to admin_index_path
    end

  end
  def create
  	@item = Item.create(item_params)
  	if @item.save
  		redirect_to(:back)
  	end
  end

  def edit
    if !user_signed_in?
      redirect_to(:back)
    end
  end

  def update
  	@item = Item.find(find_params)
  	if @item.update(item_params)
      redirect_to :back,  :notice => "Data has been updated." 
  	end
  end

  def destroy
    if user_signed_in?
    	@item = Item.find(find_params)
    	if @item.destroy
          if(params.has_key?(:fromMenu))
      		  redirect_to(:back)
          else
            redirect_to controller: 'items', action: 'new', restaurant_id: @item.restaurantId, menu_id: @item.menuId
        
        end
    	end
    end
  end

  private

  def find_params
  	@item = Item.find(params[:id])
  end

  def item_params
  	params.require(:item).permit(:name, :price, :description, :restaurantId, :menuId)
  end
end
