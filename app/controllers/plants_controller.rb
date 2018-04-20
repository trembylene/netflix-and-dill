class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  before_action :find_plant, only: [:show, :update, :destroy, :edit]

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
    @plants = @plants.where.not(latitude: nil, longitude: nil)
    @markers = @plants.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        icon: 'https://res.cloudinary.com/trembylene/image/upload/v1524193056/pin.png',
        infoWindow: {
          content: "<a href='/plants/#{plant.id}'><img src='#{plant.photo}' class='photo_markers' /><h5> $#{plant.cost}/day</h5><strong>#{plant.title}</strong><br>"
        }
      }
    end
  end

  def my
    @plants = policy_scope(current_user.plants).order(title: :asc)
    authorize @plants
  end

  def search
    if params[:search]
      @plants = policy_scope(Plant.search(params[:search]))
    else
      @plants = policy_scope(Plant)
    end
    @plants = @plants.order("created_at DESC").group_by { |p| p.plant_type }
    # @plants = @plants.where.not(latitude: nil, longitude: nil)
    @markers = @plants.values.flatten.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        id: plant.id,
        icon: 'https://res.cloudinary.com/trembylene/image/upload/v1524193056/pin.png',
        infoWindow: {
          content: "<a href='#{plant.id}'><img src='#{plant.photo}' class='photo_markers' /><h5> $#{plant.cost}/day</h5><strong>#{plant.title}</strong><br>"
        }
      }
    end
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
      flash[:notice] = "#{@plant.title} has been added!"
      redirect_to my_plants_path(@plant)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new(start_date: Date.today, end_date: Date.today, plant: @plant)
    @bookings = Booking.where(plant:@plant)
    authorize @plant
    @markers = [{
      lat: @plant.latitude,
      lng: @plant.longitude,
      icon: 'https://res.cloudinary.com/trembylene/image/upload/v1524193056/pin.png',
      infoWindow: {
          content: "<a href='#{@plant.id}'><img src='#{@plant.photo}' class='photo_markers' /><h5> $#{@plant.cost}/day</h5><strong>#{@plant.title}</strong><br>"
      }
    }]
  end

  def edit
    authorize @plant
  end

  def update
    @plant.update(plant_params)
    authorize @plant
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Your plant was successfully updated.' }
      else
        format.html { render :edit }
      end
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
    params.require(:plant).permit(:title, :address, :description, :care, :photo, :photo_cache, :cost, :plant_type)
  end
end
