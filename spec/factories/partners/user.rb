FactoryBot.define do
  factory :partners_user, class: Partners::User do
    email { Faker::Internet.email }
    password { 'password' }

    after(:build) do |partner_user, option|
      partner_user.partner = FactoryBot.build(:partners_partner, name: partner_user.email)
    end
  end
end


