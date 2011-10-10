Given /^the user "([^"]*)" has an account$/ do |username|
  @user = User.create! username: username, password: 'password'
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

Then /^he should see "([^"]*)"$/ do |message|
  page.should have_content(message)
end

Then /^he should be asked to try logging in again$/ do
  current_path.should eq(sessions_path)
  page.should have_content("Invalid username or password. Please try again.")
end
