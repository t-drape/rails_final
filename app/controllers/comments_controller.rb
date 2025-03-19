class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to Post.find(params[:post_id])
    else
      redirect_to posts_path
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  # end

  private

  def comment_params
    params.expect(comment: [ :body, :user_id, :post_id ])
  end
end
