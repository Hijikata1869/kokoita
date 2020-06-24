class UsersController < ApplicationController
  before_action :authenticate_user!
    def show
      @user = User.find(params[:id])
      @posts = @user.posts
    end

    def edit
      @user.picture.cache! unless @user.picture.blank?
    end

    def destroy
    end
end
