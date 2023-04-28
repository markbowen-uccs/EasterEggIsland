FactoryBot.define do
    factory :testUser do
      email { Faker::Internet.free_email }
      password = Faker::Internet.password(min_length: 6)
      password { password }
      password_confirmation { password }
      id {0x000055bc27df08c0}
    end
end