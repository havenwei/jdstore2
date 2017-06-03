class Account::DesignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @designs = current_user.designs
  end

  def create
    @design = Design.new
    @design.user = current_user
    @design.title = current_custom.useto

    if @design.save
      current_custom.custom_items.each do |custom_item|
        design_list = DesignList.new
        design_list.design = @design
        design_list.fitting_id = custom_item.fitting_id
        design_list.size = custom_item.size
        design_list.save
      end
      redirect_to account_design_path(@design)
    else
      render 'custom_boards'
    end
  end

  def show
    @design = Design.find(params[:id])
    @design_lists = @design.design_lists
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    flash[:alert] = "已删除该方案"
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end

end
