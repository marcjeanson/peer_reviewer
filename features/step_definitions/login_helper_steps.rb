Given /^a logged in admin user$/ do
  @admin = User.create! username: 'admin', password: 'password', role: 'admin'
  login(@admin.username, @admin.password)
end

Given /^a logged in manager/ do
  @manager = User.create! username: 'dvader', password: 'password', role: 'manager'
  login(@manager.username, @manager.password)
end
