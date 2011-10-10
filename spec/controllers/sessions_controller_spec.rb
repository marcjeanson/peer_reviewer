require 'spec_helper'

describe SessionsController do

  describe "GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { should respond_with(:success) }
    it { should_not set_the_flash }
  end
end
