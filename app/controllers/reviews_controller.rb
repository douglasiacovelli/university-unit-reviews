class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :find_unit, only: [:new, :create, :edit, :update]

  def index
    @reviews = Review.where(:unit_id => params[:unit_id])
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to unit_reviews_path(@unit), notice: 'Avaliação salva com sucesso.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review atualizada'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private

    def find_unit
        @unit = Unit.find(params[:unit_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :unit_id, :rating_relevance, :rating_difficulty, :rating_teaching, :rating_exam, :rating_worth_it, :year, :semester)
    end

end
