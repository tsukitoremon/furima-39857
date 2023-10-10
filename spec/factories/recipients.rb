FactoryBot.define do
  factory :recipient do
        name {Faker::Name.last_name}
        email {Faker::Internet.email}
        password {Faker::Internet.password(min_length: 6)}
        password_confirmation {password}
      end
    end

