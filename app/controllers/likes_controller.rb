class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(comment_params)
    if @like.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.expect(like: [ :user_id, :post_id ])
  end
end
