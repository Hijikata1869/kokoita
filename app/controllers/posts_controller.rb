class PostsController < ApplicationController

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
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image).merge(user_id: current_user.id)
    end

end
