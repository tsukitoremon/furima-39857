class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_from
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image

  validates :item, :price,:content, presence: true
  validates :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." },
                              on: :create, allow_blank: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_from_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
