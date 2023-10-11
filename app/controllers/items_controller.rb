class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_edit, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user != current_user
      redirect_to item_path(@item)
    else
      item.destroy
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_edit
    if !@item.order.nil?
      redirect_to action: :index
    elsif @item && current_user.id != @item.user_id
      redirect_to action: :index
    end
  end
end
