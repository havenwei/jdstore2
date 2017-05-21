class Admin::FittingsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @fittings = Fitting.all
  end

  def show
    @fitting = Fitting.find(params[:id])
  end

  def new
    @fitting = Fitting.new
  end

  def create
    @fitting = Fitting.new(fitting_params)

    if @fitting.save
      redirect_to admin_fittings_path
    else
      render :new
    end
  end

  def edit
    @fitting = Fitting.find(params[:id])
  end

  def update
    @fitting = Fitting.find(params[:id])

    if @fitting.update(fitting_params)
      redirect_to admin_fittings_path, notice: "配件信息更新成功！"
    else
      render :edit
    end
  end

  private

  def fitting_params
    params.require(:fitting).permit(:title, :pid, :price, :quantity, :image)
  end
end
