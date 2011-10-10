require 'spec_helper'

describe SessionsController do
  let(:user) { stub_model(User) }

  describe "GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { should respond_with(:success) }
    it { should_not set_the_flash }
  end

  describe "POST :create" do

    context "valid login" do
      before do
        User.should_receive(:authenticate_for_username).with('whatever', 'password').and_return(user)
        post :create, :username => 'whatever', :password => 'password'
      end

      it { should redirect_to('/') }
      it "stores the user_id in the session" do
        session[:user_id].should eq(user.id)
      end
    end

    context "invalid login" do
      before do
        User.should_receive(:authenticate_for_username).with('whatever', 'password').and_return(false)
        post :create, :username => 'whatever', :password => 'password'
      end

      it { should render_template(:new) }
      it { should set_the_flash.to(:alert => "Invalid username or password") }
      it "does not store the user_id in the session" do
        session[:user_id].should be_nil
      end
    end
  end

  describe "DELETE :destroy" do
    before do
      session[:user_id] = 1
      delete :destroy
    end

    it "clears the user_id from the session" do
      session[:user_id].should be_nil
    end

    it { should redirect_to(new_session_path) }
    it { should_not set_the_flash }
    it { @controller.current_user.should be_nil }
  end
end
