class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def favorites
  	@user = User.find(params[:id])
  end

  def follows
  	@user = User.find(params[:id])
  	@follows = @user.followings
  end

  def followers
  	@user = User.find(params[:id])
  	@followers = @user.followers
  end
end
