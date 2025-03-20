class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comment = Comment.new
    @like = LikedPost.new
    @follow = Follow.new
  end

  def new
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
    @comment = Comment.new
    @like = LikedPost.new
    @follow = Follow.new
    @user = User.find(@post.user_id)
    @users_liked = @post.users_liked
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

  def comment_params
    params.expect(comment: [ :body, :user_id, :post_id ])
  end
end

