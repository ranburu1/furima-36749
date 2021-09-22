FactoryBot.define do
  factory :item do
    title { '名前' }
    explanatory_text { '説明' }
    price { 2000 }
    delivery_days_id { 2 }
    area_id { 2 }
    shipping_fee_id { 2 }
    status_id          { 2 }
    category_id        { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
