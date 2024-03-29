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
    let(:review) { mock_model(Review).as_null_object }

    before do
      Review.stub(:new).and_return(review)
    end

    it "creates a new review" do
      Review.should_receive(:new).with("title" => "Annual Review").and_return(review)
      post :create, :review => {title: 'Annual Review' }
    end

    context "when the review saves successfully" do
      before do
        review.stub(:save).and_return(true)
        post :create
      end

      it { should redirect_to(reviews_path) }
      it { should set_the_flash.to(notice: "The review was created!") }
    end

    context "when the review fails to save" do
      before do
        review.stub(:save).and_return(false)
        post :create
      end

      it { should assign_to(:review).with(review) }
      it { should render_template(:new) }
    end
  end

end
