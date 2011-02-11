Given /^I am logged into the site$/ do
  visit root_url
  click_link("Sign in with Facebook")
end

