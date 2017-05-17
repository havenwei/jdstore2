class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = current_user.orders.order("id DESC")
  end
end
