class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
    def show
      @user = User.find(params[:id])
      @posts = @user.posts.order("created_at DESC")
    end

    def edit
      @user.picture.cache! unless @user.picture.blank?
    end

    def destroy
    end
end
