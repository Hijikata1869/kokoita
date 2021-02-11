class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy new edit update]

  def index
    @q = Post.ransack(params[:q])
    @prefectures = Prefecture.all
    @categories = Category.all
    @posts = @q.result(distinct: true)
  end

  def search
    @q = Post.ransack(search_params)
    @posts = @q.result(distinct: true).page(params[:page]).per(5).order('created_at DESC')
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = '投稿しました'
      redirect_to user_path(@post.user_id)
    else
      flash[:alert] = '投稿できませんでした。入力内容を見直してください。'
      redirect_to new_post_path
    end
  end

  def new; end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comment = current_user.comments.build if user_signed_in?
    @comments = @post.comments
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_update_params)
      flash[:notice] = '記事を編集しました'
      redirect_to user_path(@post.user_id)
    else
      flash[:alert] = '記事が編集できませんでした'
      redirect_to user_path(@post.user_id)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = '記事を一件削除しました'
    redirect_to user_path(post.user_id)
  end

  private

  def post_params
    params.permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def post_update_params
    params.require(:post).permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image, :remove_image, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit!
  end
end
