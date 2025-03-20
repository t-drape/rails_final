class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = Post.where(user_id: params[:id])
    @follow = Follow.new
    @influencers = @user.influencers[0..5]
    @liked = @user.liked_posts
    @down_mail = @user.email.downcase
    @hash = Digest::SHA256.hexdigest(@down_mail)
    @parameters = URI.encode_www_form('d' => "https://www.example.com/default.jpg", 's' => 100)
    @image = "https://www.gravatar.com/avatar/#{@hash}?#{@parameters}"
  end
end
