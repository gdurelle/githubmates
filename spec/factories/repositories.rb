# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    github_id "MyString"
    name "MyString"
    github_owner "MyString"
    description "MyText"
    has_issues false
    has_wiki false
  end
end
