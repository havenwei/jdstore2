class FittingsController < ApplicationController
  def index
    @fittings = Fitting.all
  end

  def show
    @fitting = Fitting.find(params[:id])
  end

  def add_to_custom_board
    @fitting = Fitting.find(params[:id])
    redirect_to :back
    flash[notice:] = "测试加入定制面板"
  end
end
