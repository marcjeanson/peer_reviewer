require 'spec_helper'

describe ReviewsController do
  let(:reviews) { 3.times.collect { stub_model(Review) } }

  describe "GET :index" do
    before do
      Review.stub(:all).and_return(reviews)
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
    it { should assign_to(:reviews).with(reviews) }
  end

  describe "GET :new" do
    let(:review) { stub }

    before do
      Review.stub(:new).and_return(review)
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
    it { should assign_to(:review).with(review) }
  end

  describe "POST :create" do
    before do
      Review.should_receive(:new).with("title" => "Annual Review")
      post :create, :review => {title: 'Annual Review' }
    end

    it { should redirect_to(reviews_path) }
    it { should set_the_flash.to(notice: "The review was created!") }
  end

end
