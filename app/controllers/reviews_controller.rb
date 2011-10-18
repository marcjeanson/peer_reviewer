class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new params[:review]
    if @review.save
      redirect_to reviews_path, notice: "The review was created!"
    else
      render :new
    end
  end
end
