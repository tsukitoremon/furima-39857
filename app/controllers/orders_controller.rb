class OrdersController < ApplicationController
  before_action :move_to_index_unsigned
  before_action :move_to_index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_recipient = OrderRecipient.new
  end

  def new
    @order_recipient = OrderRecipient.new
  end

  def create
    @order_recipient = OrderRecipient.new(order_params)

    if @order_recipient.valid?
      pay_item
      @order_recipient.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      logger.error @order_recipient.errors.full_messages.join(', ')
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :content, :image, :price, :category_id, :condition_id, :delivery_cost_id,
                                 :delivery_date_id, :delivery_from_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to items_path if current_user.id == @item.user_id
  end

  def move_to_index_unsigned
    redirect_to new_user_session_path unless user_signed_in?
  end

  def order_params
    params.require(:order_recipient).permit( :post_code, :delivery_from_id,
      :address_city, :address_street, :address_building, :tel_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(order_params[:item_id])
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end