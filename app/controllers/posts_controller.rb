class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comment = Comment.new

  end

  def new
    @comment = Comment.new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.expect(post: [ :user_id, :title, :body ])
  end
end
