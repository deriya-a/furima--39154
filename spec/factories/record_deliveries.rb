FactoryBot.define do
  factory :record_delivery do
    user_id { '1' }
    item_id { '1' }
    post_code { '123-4567' }
    region_id { '2' }
    address1 { '港区' }
    address2 { '白金台' }
    address3 { 'マンション１０１' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
