require 'spec_helper'

describe UsersController do
  let(:user) { mock_model(User) }
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
    before do
      User.stub(:new).and_return(user)
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
    it { should assign_to(:user).with(user) }
  end

  describe "POST :create" do
    before { User.stub(:new).and_return(user) }

    context "user has valid data" do
      before do
        user.stub(:save).and_return(true)
        post :create, :user => { :username => 'dvader', :password => 'password' }
      end

      it { should redirect_to(users_path) }
      it { should set_the_flash.to(notice: "The user was created!") }
    end

    context "user has invalid data" do
      before do
        user.stub(:save).and_return(false)
        post :create, :user => { :username => 'dvader', :password => 'password' }
      end

      it { should render_template(:new) }

    end
  end

end
