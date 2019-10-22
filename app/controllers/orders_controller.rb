class OrdersController < ApplicationController

  def show

  end

  def new

  end

  def create
    # byebug
    # Next two lines can be replaced with @order = Order.create(order_params)
    @order = Order.new(order_params)
    @order.save

    respond_to do |format|
      format.js
    end
  end

  def show_all
    @orders = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :product_id, :purchase_id)
  end

end
