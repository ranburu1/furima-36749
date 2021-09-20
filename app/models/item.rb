class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions

 has_one :order
 belongs_to :user
 belongs_to :category
 belongs_to :status
 belongs_to :shipping_fee
 belongs_to :delivery_days
 belongs_to :area
 has_one_attached :image
end
