class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  # def index
  # @items = Item.order('created_at DESC')
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:item, :content, :image, :price, :category_id, :condition_id, :delivery_cost_id,
                                 :delivery_date_id, :delivery_from_id).merge(user_id: current_user.id)
  end
end
