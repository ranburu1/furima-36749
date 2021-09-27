class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :block, :building, :phone_number, :token
  validates :area_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
