FactoryBot.define do
  factory :user do
    type {"Expert"}
    username { Faker::Name.name_with_middle}
    email { Faker::Internet.email }
    password{ "123456" }
    status { "qualified" }
    profession { "Software Engineer" }
    service { "Web Development" }
  end
end
 