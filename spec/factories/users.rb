FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) + '1a' }
    password_confirmation { password }
    nickname { Faker::Name.last_name }
    family_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Date.new(1983, 1, 1) }
  end
end
