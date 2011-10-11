Given /^a logged in admin user$/ do
  @admin = User.create! username: 'admin', password: 'password', role: 'admin'
  login(@admin.username, @admin.password)
end

Given /^the following users:$/ do |table|
  table.hashes.each do |user|
    User.create! user.merge(password: 'password', role: 'employee')
  end
end

When /^I visit the user admin page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see all the users$/ do
  pending # express the regexp above with the code you wish you had
end
