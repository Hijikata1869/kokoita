class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = 'コメントしました'
      redirect_to post_path(id: params[:post_id])
    else
      flash[:alert] = 'コメントできませんでした'
      redirect_to post_path(id: params[:post_id])
    end
  end

  def destroy
    Comment.find_by(id: params[:format], post_id: params[:post_id]).destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to post_path(id: params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
