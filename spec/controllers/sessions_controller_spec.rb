require 'spec_helper'

describe SessionsController do

  describe "GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { should respond_with(:success) }
    it { should_not set_the_flash }
  end

  describe "POST :create" do
    let(:user) { stub_model(User) }

    before do
      User.should_receive(:authenticate_for_username).with('whatever', 'password').and_return(user)
      post :create, :username => 'whatever', :password => 'password'
    end

    it { should redirect_to('/') }
    it "stores the user_id in the session" do
      session[:user_id].should eq(user.id)
    end
  end
end
