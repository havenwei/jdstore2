class FittingsController < ApplicationController
  def index
    # @fittings = Fitting.all
    @fittings = case params[:category]
    when '样式'
      Fitting.where(category: '样式')
    when '布料'
      Fitting.where(category: '布料')
    when '罗马杆'
      Fitting.where(category: '罗马杆')
    else
      Fitting.all
    end

  end

  def show
    @fitting = Fitting.find(params[:id])
  end

  def add_to_custom_board
    @fitting = Fitting.find(params[:id])
    current_custom.add_fitting_to_custom_board(@fitting)
    flash[:notice] = "已加入定制面板"
    redirect_to :back
  end
end
