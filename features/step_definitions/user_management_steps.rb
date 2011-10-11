Given /^the following users:$/ do |table|
  @users = []
  table.hashes.each do |user|
    @users << User.create!(user.merge(password: 'password', role: 'employee'))
  end
end

When /^I visit the user admin page$/ do
  visit(users_path)
end

Then /^I should see all the users$/ do
  @users.each do |user|
    within("#user_#{user.id}") do
      [user.username, user.first_name, user.last_name].each do |content|
        page.should have_content(content)
      end
    end
  end
end

Then /^I should be on the new user page$/ do
  current_path.should eq(new_user_path)
end

Given /^I am on the new user page$/ do
  visit(new_user_path)
end

When /^I submit valid new user data$/ do
  fill_in("Username", with: "dvader")
  fill_in("Password", with: "yodasucks")
  fill_in("First name", with: "Darth")
  fill_in("Last name", with: "Vader")
  click_on("Create")
end

Then /^I should see the new user in the list of users$/ do
  new_user = User.find_by_username 'dvader'
  within("#user_#{new_user.id}") do
    page.should have_content("dvader")
    page.should have_content("Darth")
    page.should have_content("Vader")
  end
end

