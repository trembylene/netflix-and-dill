class PlantsController < ApplicationController
  before_action :find_plant, only: [:show, :edit, :update, :destroy]
  def index
    # @plants = Plant.all
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    @plant.user_id = current_user.id
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @booking.plant = @plant
    authorize @plant
  end

  def edit
    authorize @plant
  end

  def update
    @plant.update(plant_params)
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
    redirect_to plants_path
  end

  private

  def find_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:title, :description, :care, :photo, :photo_cache, :cost, :plant_type)
  end
end
