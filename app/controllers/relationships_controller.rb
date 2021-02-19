class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    user = User.find(params[:user_id])
    follow.save
    flash[:notice] = "#{user.nickname}さんをフォローしました"
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    flash[:notice] = 'フォローを解除しました'
    redirect_to user_path(params[:user_id])
  end
end
