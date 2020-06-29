class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :new, :edit, :update]


  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def serch
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true)
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
      redirect_to user_path(@post.user_id)
    else
      flash[:success] = "記事が編集できませんでした"
      redirect_to root_url
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = "記事を一件削除しました"
    redirect_to user_path(post.user_id)
  end

  private
    def post_params
      params.permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image).merge(user_id: current_user.id)
    end

    def post_update_params
      params.require(:post).permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image, :remove_image).merge(user_id: current_user.id)
    end

    def search_params
      params.require(:q).permit!
    end



end
