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
  visit(login_path)
  fill_in('Username', with: 'garbage')
  fill_in('Password', with: 'password')
  click_on('Login')
end

Then /^he should be asked to try again$/ do
  current_path.should eq(sessions_path)
  page.should have_content("Invalid username or password")
end
