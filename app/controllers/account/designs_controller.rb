class Account::DesignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @designs = current_user.designs
  end

  def create
    if current_custom.custom_items.presence
      @design = Design.new
      @design.user = current_user
      @design.title = current_custom.useto
      @design.window_width = current_custom.window_width
      @design.window_height = current_custom.window_height

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
        redirect_to custom_boards_path
        flash[:alert] = "请确认方案没有错误！"
      end
    else
      redirect_to custom_boards_path
      flash[:alert] = "请添加窗帘部件"
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
