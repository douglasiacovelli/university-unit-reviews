module Admin
  class ReviewsController < ApplicationController
    before_action :set_review, only: [:show]

    def index
      @reviews = Review.all
    end

    private
      def set_review
        @review = Review.find(params[:id])
      end
  end
end
