class ProductsController < ApplicationController
  before_action :require_login, :except => [:show]

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.saved_price = params[:product][:price]

    if @product.save
      redirect_to pages_index_path
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.saved_price = params[:product][:price]
    @product.save

    if @product.update(product_params)
      redirect_to pages_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to pages_index_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :img_url, :category)
  end
end
