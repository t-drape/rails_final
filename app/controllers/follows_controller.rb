class FollowsController < ApplicationController
  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      if params[:follow][:page] == "1"
        redirect_to Post.find(params[:follow][:page_id])
      elsif params[:follow][:page] == "2"
        redirect_to User.find(@follow.influencer_id)
      else
        redirect_to posts_path
      end
    else
      redirect_to posts_path
    end
  end

  def destroy
    puts params
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to posts_path
  end

  private

  def follow_params
    params.expect(follow: [ :influencer_id, :follower_id ])
  end
end
