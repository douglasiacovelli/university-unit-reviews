module Admin
  class ReviewsController < ApplicationController
    before_action :find_review, only: [:show]

    def index
      @reviews = Review.all
    end

    private

    def find_review
      @review = Review.find(params[:id])
    end
  end
end
