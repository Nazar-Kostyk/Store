class PagesController < ApplicationController
  before_action :require_login, :except => [:index, :films, :toys, :gadgets]
  def index

  end

  def films
    #byebug
    films_count = Product.where(category: 'Films').count
    if films_count % 6 == 0
      @films_count = films_count / 6
    else
      @films_count = films_count / 6 + 1
    end
    @films = Product.where(category: 'Films').limit(6).offset(params[:skip])
  end

  def toys
    if Product.where(category: 'Toys').count % 6 == 0
      @toys_count = Product.where(category: 'Toys').count / 6
    else
      @toys_count = Product.where(category: 'Toys').count / 6 + 1
    end
    @toys = Product.where(category: 'Toys').limit(6).offset(params[:skip])
  end

  def gadgets
    if Product.where(category: 'Gadgets').count % 6 == 0
      @gadgets_count = Product.where(category: 'Gadgets').count / 6
    else
      @gadgets_count = Product.where(category: 'Gadgets').count / 6 + 1
    end
    @gadgets = Product.where(category: 'Gadgets').limit(6).offset(params[:skip])
  end

  def bin
    user_products = Order.where(user_id: current_user.id)

    @products_ids = user_products.map do |product|
      product.product_id
    end

    @products = []
    @products_ids.each { |_id| @products.push(Product.find_by(id: _id)) }
    # @products = Product.where(id: products_ids)
    # byebug
    @sum = 0
    @products.each { |product| @sum += product.price }
  end

  def mail
  end

  def send_mail
    @users = User.all
    @users.each do |usr|
      if !usr.admin
        UserMailer.with(user: usr, text: params[:text]).send_email.deliver_now
      end
    end
  end

end
