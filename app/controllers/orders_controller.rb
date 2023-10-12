class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index_unsigned
  before_action :move_to_index

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order = Order.new
    @order_recipient = OrderRecipient.new
  end

  def create
    @order_recipient = OrderRecipient.new(order_params)

    if @order_recipient.valid?
      pay_item
      @order_recipient.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def move_to_index
    redirect_to items_path if current_user.id == @item.user_id
    redirect_to root_path unless @item.order.nil?
  end

  def move_to_index_unsigned
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_recipient).permit(:post_code, :delivery_from_id,
                                            :address_city, :address_street, :address_building, :tel_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    item = Item.find(order_params[:item_id])
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
