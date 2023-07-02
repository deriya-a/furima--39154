FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::DragonBall.character }
    detail { 'テスト商品の説明テスト商品の説明テスト商品の説明' }
    category_id { '2' }
    condition_id { '2' }
    delivery_fee_id { '2' }
    region_id { '2' }
    delivery_within_id { '2' }
    price { Faker::Number.number(digits: 4) }
    association :user
  end
end
