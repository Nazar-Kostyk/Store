class OrdersHistoriesController < ApplicationController
  def show_all
    @orders_keys = OrdersHistory.where(user_id: current_user.id).select(:order_key).distinct
  end

  def new

  end

  def create
    # byebug
    params[:orders_history][:product_id].each do |id_|
      OrdersHistory.create({ user_id: params[:orders_history][:user_id], order_key: params[:orders_history][:order_key], product_id: id_ })
    end

    redirect_to orders_delete_all_path
  end

  private
  def history_params
    params.require(:orders_history).permit(:user_id, :order_key, :product_id)
  end
end
