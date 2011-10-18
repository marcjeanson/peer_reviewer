class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    redirect_to reviews_path, notice: "The review was created!"
  end
end
