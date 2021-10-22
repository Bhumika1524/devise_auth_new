class CommentsController < ApplicationController

  def edit
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id == current_user.id
      if @comment.update(comment_params)
        redirect_to post_path(@post.id)
      else
        if @comment.errors.any?
          @comment.errors.full_messages
        end
        render :edit
      end
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
    end
    redirect_to post_path(@post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :post_id, :user_id, :_destroy)
  end

end
