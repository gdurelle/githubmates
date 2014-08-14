# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repository do
    github_id "123456"
    name "githubmates"
    github_owner "gdurelle"
    description "lorem  ipsum dolor sit amet consectur"
    has_issues true
    has_wiki true
  end
end
