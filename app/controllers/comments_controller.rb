class CommentsController < ApplicationController
  before_action :require_login, :except => [:show]

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to pages_index_path
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.save

    if @comment.update(product_params)
      redirect_to pages_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to pages_index_path
  end

  private
  def comment_params
    params.require(:comment).permit(:id_user, :id_product, :text)
  end
end
