FactoryBot.define do
  factory :item do
    item { '餃子' }
    user                  { 'furima太郎' }
    price                 { '10000' }
    content              { 'おすすめです。' }
    category_id          { '2' }
    condition_id { '2' }
    delivery_from_id { '30' }
    delivery_date_id { '2' }
    delivery_cost_id { '3' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/uma.png'), filename: 'uma.png')
    end
  end
end
