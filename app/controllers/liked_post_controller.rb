class LikedPostController < ApplicationController

  def new
    @like = LikedPost.new
  end

  def create
    @like = LikedPost.new(like_params)
    if @like.save
      if params[:like][:page] == "1"
        redirect_to Post.find(@like.post_id)
      else
        redirect_to posts_path
      end
    else
      redirect_to posts_path
    end
  end

  def destroy
    @like = LikedPost.find(params[:id])
    if @like.destroy
      redirect_to Post.find(params[:post_id])
    else
      redirect_to posts_path
    end
  end

  private

  def like_params
    params.expect(like: [ :user_id, :post_id ])
  end
end
