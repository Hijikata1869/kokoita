class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit destroy]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5).order('created_at DESC')
  end

  def edit
    @user.picture.cache! if @user.picture.present?
  end

  def destroy; end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
