require 'spec_helper'

describe UsersController do
  let(:users) { 3.times.collect { stub_model(User) } }

  describe "GET :index" do
    before do
      User.stub(:all).and_return(users)
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
    it { should assign_to(:users).with(users) }
  end

  describe "GET :new" do
    let(:user) { stub }

    before do
      User.stub(:new).and_return(user)
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
    it { should assign_to(:user).with(user) }
  end

end