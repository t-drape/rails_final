class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    puts params
    if @comment.save
      if params[:comment][:page] == "1"
        redirect_to Post.find(@comment.post_id)
      else
        redirect_to posts_path
      end
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
    params.expect(comment: [ :body, :user_id, :post_id])
  end
end
