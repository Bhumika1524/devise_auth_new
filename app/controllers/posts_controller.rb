class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      if @post.errors.any?
        @post.errors.full_messages
      end
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      if @post.errors.any?
        @post.errors.full_messages
      end
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :user_id,
                                 comments_attributes: %i[id description post_id user_id _destroy])
  end

end
