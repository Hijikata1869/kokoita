class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
  end

  def new
    @post = Post.new
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
      params.require(:post).permit(:found_animal, :content, :category_id, :prefecture_id, :found_date, :image)
    end

end
