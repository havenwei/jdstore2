class FittingsController < ApplicationController
  def index
    @fittings = Fitting.all
  end

  def show
    @fitting = Fitting.find(params[:id])
  end
end
