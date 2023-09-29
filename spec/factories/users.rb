FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { '111aaa' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_yomi        { 'ヤマダ' }
    first_name_yomi       { 'リクタロウ' }
    birthday              { '1986-08-10' }
  end
end
