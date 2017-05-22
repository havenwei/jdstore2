class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin!"
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  helper_method :current_custom

  def current_custom
    @current_custom ||= find_custom
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  def find_custom
    custom_board = CustomBoard.find_by(id: session[:custom_board_id])
    if custom_board.blank?
      custom_board = CustomBoard.create
    end
    session[:custom_board_id] = custom_board.id
    return custom_board
  end
end
