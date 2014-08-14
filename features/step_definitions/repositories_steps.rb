Given(/^I'm on the home page$/) do
  visit root_path
end

Given(/^there is github repository's form$/) do
  expect(page).to have_selector '#repository_github_owner'
  expect(page).to have_selector '#repository_name'
end

When(/^I fill the form with user = "(.*?)", repo = "(.*?)" and submit it$/) do |user, repo|
  fill_in 'repository_github_owner', with: user
  fill_in 'repository_name', with: repo
  click_button I18n.t(:go)
end

Then(/^I should see a Google Map with markers representing commiters of the repo$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Every markers should have an info window containing commiter's infos\.$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^All commiters who don't have any location informations should be listed under the map\.$/) do
  expect(page).to have_content 'Gregory Durelle'
end
