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
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_cost, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_from, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date, numericality: { other_than: 1 , message: "can't be blank"}
end
