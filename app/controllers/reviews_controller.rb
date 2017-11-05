class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    if (params[:unit].blank?)
      redirect_to units_url
    else
      @review = Review.new
      @unit = Unit.find(params[:unit])
    end
  end

  def edit
  end

  def create
    @unit = Unit.find(review_params[:unit_id])
    @review = Review.create(review_params)

    if @review.save
      redirect_to @review, notice: 'Avaliação salva com sucesso.'
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
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :unit_id, :rating_relevance, :rating_difficulty, :rating_teaching, :rating_exam, :rating_worth_it, :year, :semester)
    end

end
