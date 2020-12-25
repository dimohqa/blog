FactoryBot.define do
  factory :comment do
    username { "MyString" }
    body { "MyText" }
    post { nil }
  end
end
