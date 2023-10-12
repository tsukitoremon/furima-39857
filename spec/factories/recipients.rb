FactoryBot.define do
  factory :recipient do
    post_code { '150-0041' }
    tel_number { '0120444444' }
    delivery_from_id { '20' }
    address_city { '大阪市' }
    address_street { '難波123' }
    address_building { '鶴橋ビル2' }
  end
end
