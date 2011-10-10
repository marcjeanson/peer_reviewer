Given /^the user "([^"]*)" has an account$/ do |username|
  @user = User.create! username: username, password: 'password'
end

When /^he logs in$/ do
  visit(login_path)
  fill_in('Username', with: @user.username)
  fill_in('Password', with: @user.password)
  click_on('Login')
end

Then /^he should see "([^"]*)"$/ do |message|
  page.should have_content(message)
end

When /^he tries to login with an invalid username$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^he should be asked to try again$/ do
  pending # express the regexp above with the code you wish you had
end
