FactoryBot.define do
  factory :order_shipping_address do
    postcode { '123-4567' }
    area_id { 2 }
    city { '宮城県' }
    block { '1-1' }
    building { 'レオパレス103' }
    phone_number { '0901234567' }
  end
end
