class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  
  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true


  validates :category_id,              numericality: { other_than: 1 } 
  validates :status_id,                numericality: { other_than: 1 } 
  validates :shipping_fee_id,          numericality: { other_than: 1 } 
  validates :prefecture_id,            numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,    numericality: { other_than: 1 } 

  belongs_to :user
  has_one    :order

  has_one_attached :image


end

