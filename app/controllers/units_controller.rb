class UnitsController < ApplicationController
  before_action :find_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = Unit.all
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def edit
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to @unit, notice: 'Unit was successfully created.'
    else
      render :new
    end
  end

  def update
    if @unit.update(unit_params)
      redirect_to @unit, notice: 'Unit was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @unit.destroy
    redirect_to units_path, notice: 'Unit was successfully destroyed.'
  end

  private

  def find_unit
    @unit = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(:title, :course_id, :teachers_name)
  end
end
