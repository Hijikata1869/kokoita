class StaticPagesController < ApplicationController
  def home
    @posts = Post.page(params[:page]).order('created_at DESC')
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @danger_tag_posts = Post.joins(:tags).where('tag_name like ?', '%危険%').order('created_at desc').limit(5)
    if user_signed_in?
      @following_user_posts = Post.where(user_id: [current_user.following_ids]).limit(5)
    end
  end

  def help; end

  def about; end

  def contact; end
end
