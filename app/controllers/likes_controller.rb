class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(like_params)
    @like.user_id = current_user.id

    if @like.save

      redirect_to user_post_path(@post.author_id, @post), success: "You liked this post!"
    else
      redirect_to user_post_path(@post.author_id, @post), alert: "Failed to like this post!"
    end
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
