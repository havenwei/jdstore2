class CustomBoardsController < ApplicationController
  def clean
    current_custom.clean!
    flash[:warning] = "已清空购物车"
    redirect_to custom_boards_path
  end
end
