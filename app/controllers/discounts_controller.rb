class DiscountsController < ApplicationController
  before_action :require_login, :except => [:discounts]

  def new
    @discount = Discount.new
  end

  def create
    # byebug
    if Discount.where(category: params[:discount][:category]).first == nil
      @discount = Discount.new(discount_params)
      if @discount.save
        # byebug
        Product.where(category: @discount.category).each { |product| product.update(price: (product.price - (product.saved_price * @discount.percents/100))) }
        redirect_to discounts_discounts_path
      else
        render 'new'
      end
    else
      redirect_to discounts_change_path({ discount: {category: params[:discount][:category], percents: params[:discount][:percents]}})
    end
  end

  def destroy
    @discount = Discount.find(params[:id])
    # byebug
    Product.where(category: @discount.category).each { |product| product.update(price: (product.price + (product.saved_price * @discount.percents/100))) }
    @discount.destroy

    redirect_to discounts_discounts_path
  end

  def change
    # byebug
    @discount = Discount.where(category: params[:discount][:category]).first
    @discount.percents = params[:discount][:percents]
    Product.where(category: @discount.category).each { |product| product.update(price: (product.price - (product.saved_price * @discount.percents/100))) }
    @discount.save
    redirect_to discounts_discounts_path
  end

  def discounts
    @discounts = Discount.all
  end

  private
  def discount_params
    params.require(:discount).permit(:category, :percents)
  end
end
