class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @plants = policy_scope(Plant).order(created_at: :desc)
    if params[:search]
      @plants = Plant.search(params[:search]).order("created_at DESC")
    else
      @plants = Plant.all.order("created_at DESC")
    end
  end
end
