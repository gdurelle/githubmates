# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contributor do
    github_login "gdurelle"
    github_url "MyString"
    github_avatar_url "MyString"
    gravatar_id "MyString"
    github_location "Paris"
    github_name "Gregory Durelle"
  end
end
