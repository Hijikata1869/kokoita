class StaticPagesController < ApplicationController
  def home
    @posts = Post.page(params[:page]).order('created_at DESC')
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def help; end

  def about; end

  def contact; end
end
