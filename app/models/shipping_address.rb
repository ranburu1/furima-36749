class ShippingAddress < ApplicationRecord
  belongs_to :order
  belongs_to :area
end
