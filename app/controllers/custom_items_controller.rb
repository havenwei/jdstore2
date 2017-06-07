class CustomItemsController < ApplicationController
  def update
    # @custom_board = current_custom
    # @custom_item = @custom_board.custom_items.find_by(fitting_id: params[:id])
    @custom_item = CustomItem.find(params[:id])
    @custom_item.update(custom_item_params)
    redirect_to custom_boards_path
  end

  def destroy
    @custom_item = CustomItem.find(params[:id])
    @fitting = @custom_item.fitting
    @custom_item.destroy
    if @fitting.presence
      flash[:warning] = "已从窗帘方案中删除：#{@fitting.title}"
    else
      flash[:alert] = "已删除失效商品"
    end
    redirect_to :back
  end

  private

  def custom_item_params
    params.require(:custom_item).permit(:size)
  end
end
