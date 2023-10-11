FactoryBot.define do
  factory :order_recipient do
    post_code { '150-0041' }
    tel_number { '0120444444' }
    delivery_from_id { '20' }
    address_city { '大阪市' }
    address_street { '難波123' }
    address_building { '鶴橋ビル2' }
    token { '123456789101112' }
  end
end
