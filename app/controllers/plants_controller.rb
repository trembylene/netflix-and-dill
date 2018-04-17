class PlantsController < ApplicationController
  before_action :find_plant, only: [:show, :update, :destroy, :edit]
  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Your plant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def find_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:title, :description, :care, :photo, :photo_cache)
  end
end
