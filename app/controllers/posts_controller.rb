class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :new, :edit, :update]


  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    end
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_update_params)
      flash[:success] = "記事を編集しました"
      redirect_to root_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = "記事を一件削除しました"
    redirect_to root_url
  end

  private
    def post_params
      params.permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image).merge(user_id: current_user.id)
    end

    def post_update_params
      params.require(:post).permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image).merge(user_id: current_user.id)
    end



end
