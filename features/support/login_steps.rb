module LoginSteps
  def login(username, password)
    visit(login_path)
    fill_in('Username', with: username)
    fill_in('Password', with: password)
    click_on('Login')
  end
end

World(LoginSteps)
