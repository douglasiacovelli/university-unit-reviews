class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.create(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Avaliação salva com sucesso.' }
        format.json { render :show, status: :created, location: @review}
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
    end

    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review atualizada' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :unit, :rating, :year, :semester)
    end

end
