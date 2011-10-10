Given /^the user "([^"]*)" has an account$/ do |username|
  @user = User.create! username: username, password: 'password'
end

Given /^a logged in user$/ do
  @user = User.create! username: 'marc', :password => 'thepassword'
  login(@user.username, @user.password)
end

When /^he logs in$/ do
  login(@user.username, @user.password)
end

When /^he tries to login with an invalid username$/ do
  login('garbage', 'password')
end

When /^he tries to login with an invalid password$/ do
  login(@user.username, 'wrongpassword')
end

When /^he logs out$/ do
  click_on('Logout')
end

Then /^he should see "([^"]*)"$/ do |message|
  page.should have_content(message)
end

Then /^he should be asked to try logging in again$/ do
  current_path.should eq(sessions_path)
  page.should have_content("Invalid username or password. Please try again.")
end

Then /^he should be redirected to the login page$/ do
  current_path.should eq(new_session_path)
end

