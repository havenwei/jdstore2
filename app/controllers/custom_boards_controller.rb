class CustomBoardsController < ApplicationController
  def clean
    current_custom.clean!
    current_custom.window_width = 0
    current_custom.window_height = 0
    current_custom.useto = nil
    current_custom.save
    flash[:warning] = "已重置方案"
    redirect_to custom_boards_path
  end

  def update
    current_custom.update(custom_board_params)
    current_custom.custom_items.each do |custom_item|
      if custom_item.fitting.presence
        custom_item.size = custom_item.calculator(custom_item.fitting.category)
      end  
      custom_item.save
    end

    redirect_to :back
  end

  private

  def custom_board_params
    params.require(:custom_board).permit(:useto, :window_width, :window_height)
  end

end
