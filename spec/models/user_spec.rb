require 'spec_helper'

describe User do
  it { should validate_presence_of(:password) }

  it "authenticates a user with valid username and password returning a valid user" do
    @user = User.create! :username => 'marc', :password => 'password'
    User.authenticate_for_username(@user.username, 'password').should eq(@user)
  end
end
