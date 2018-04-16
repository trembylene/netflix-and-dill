class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # save booking to that instance of user
    @booking.user = current_user

    if @booking.save
      redirect_to root_path
    else
      render :new
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

