class PirateController < ApplicationController
  def user
  end

  def build
    @data = LootGrabber.new(params[:name])
  end
end
