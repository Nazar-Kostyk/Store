class OrdersController < ApplicationController
  before_action :require_login

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

  def destroy
    @order = Order.where(product_id: params[:id])
    @order.destroy_all

    redirect_to pages_bin_path
  end

  def delete_all
    Order.find_each(&:destroy)

    redirect_to pages_bin_path
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :product_id, :purchase_id)
  end

end
