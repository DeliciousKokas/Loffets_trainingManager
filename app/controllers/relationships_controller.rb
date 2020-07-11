class RelationshipsController < ApplicationController
  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 30)
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 30)
    render 'show_follow'
  end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_back(fallback_location: '/main')
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_back(fallback_location: '/main')
  end
end
