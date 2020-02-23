class RelationshipsController < ApplicationController
  def following
    @title = "Following"
    @users = current_user.following.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = current_user.followers.all
    render 'show_follow'
  end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_back(fallback_location: "/main")
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_back(fallback_location: "/main")
  end
end
