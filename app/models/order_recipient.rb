class OrderRecipient
  include ActiveModel::Model
  attr_accessor :post_code, :address_city, :address_street, :address_building, :user_id, :item_id, :tel_number, :delivery_from_id, :token

  with_options presence: true do

    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}, allow_blank: true
    validates :user_id, :address_city, :address_street, :token, :item_id
    validates :tel_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "Input only number"}, allow_blank: true
    validates :delivery_from_id, numericality: { other_than: 1, message: "can't be blank" }

  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Recipient.create( post_code: post_code, address_city: address_city, address_street: address_street, address_building: address_building, delivery_from_id: delivery_from_id, tel_number: tel_number, order_id: order.id)
  end
end