class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(comment_params)
    if @like.save
      redirect_to Post.find(params[:like][:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  # end

  private

  def comment_params
    params.expect(like: [ :user_id, :post_id ])
  end
end
