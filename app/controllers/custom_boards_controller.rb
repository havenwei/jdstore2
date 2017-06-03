class CustomBoardsController < ApplicationController
  def clean
    current_custom.clean!
    flash[:warning] = "已重置方案"
    redirect_to custom_boards_path
  end

  def update
    current_custom.update(custom_board_params)
    redirect_to :back  
  end

  private

  def custom_board_params
    params.require(:custom_board).permit(:useto)
  end

end
