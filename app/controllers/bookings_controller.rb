class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :desc)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @plant = Plant.find(params[:plant_id])
    @booking.plant = @plant
    authorize @plant
    if @booking.save
      redirect_to plant_path(@plant)
    else
      @bookings = Booking.where(plant:@plant)
      render "plants/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path, notice: "This booking has been deleted."
  end

  private

  def booking_params
    params.require(:booking).permit(:plant_id, :start_date, :end_date)
  end
end
