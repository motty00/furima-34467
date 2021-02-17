class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id

  validates :postal_code,       presence: true, inclusion: { in: - }
  validates :prefecture_id,     presence: true
  validates :city,              presence: true
  validates :address,           presence: true
  validates :phone_number,      presence: true, numericality: { with: /\A\d{10,11}\z/ }




  def save
    Orders.create(user_id: user_id, item_id: item_id)
    Addresses.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end