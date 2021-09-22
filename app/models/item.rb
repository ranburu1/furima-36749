class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  
 validates :title,            presence: true
 validates :explanatory_text, presence: true
 validates :category_id,      presence: true, numericality: { other_than: 1 }
 validates :status_id,        presence: true, numericality: { other_than: 1 }
 with_options presence: true, format: { with: /\A[0-9]+\z/ } do 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 end
 validates :shipping_fee_id,  presence: true, numericality: { other_than: 1 }
 validates :area_id,          presence: true, numericality: { other_than: 1 }
 validates :delivery_days_id, presence: true, numericality: { other_than: 1 }
 validates :image,            presence: true

 has_one :order
 belongs_to :user
 belongs_to :category
 belongs_to :status
 belongs_to :shipping_fee
 belongs_to :delivery_days
 belongs_to :area
 has_one_attached :image
end