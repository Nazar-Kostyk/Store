class UsersController < Clearance::UsersController
  before_action :require_login

  def cabinet
    @user = current_user
    # For date show @
    @orders = OrdersHistory.where(user_id: current_user.id)
    # For oder keys @
    @ids = @orders.select(:order_key).distinct
    # For sums
    @prices = Hash.new
    sum = 0
    @ids.each do |id_|
      OrdersHistory.where(order_key: id_.order_key).each { |order| sum += Product.find(order.product_id).price }
      @prices["#{id_.order_key}"] = sum
      sum = 0
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
