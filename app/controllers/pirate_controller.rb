class PirateController < ApplicationController
  def user
  end

  def build
    @data = LootGrabber.new(params[:name])
    render json: @data.page
  end
end
