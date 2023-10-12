class OrderRecipient
  include ActiveModel::Model
  attr_accessor :post_code, :address_city, :address_street, :address_building, :user_id, :item_id, :tel_number,
                :delivery_from_id, :token

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, allow_blank: true
  validates :tel_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'Input only number' }, allow_blank: true
  validates :delivery_from_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :post_code, :tel_number, :user_id, :address_city, :address_street, :token, :item_id, :delivery_from_id, presence: true

  def save
    order = Order.create(user_id:, item_id:)
    Recipient.create(post_code:, address_city:, address_street:,
                     address_building:, delivery_from_id:, tel_number:, order_id: order.id)
  end
end
