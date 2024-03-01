class PostsController < ApplicationController
  before_action :user, only: %i[index show]

  def index
    @posts = @user.posts.paginate(page: params[:page], per_page: 2).order('created_at DESC')
  end

  def new
    @post = current_user.posts.new
    render :new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to user_path(current_user)
    else
      flash.now[:error] = 'Post could not be created.'
      render :new
    end
  end

  def show
    @user
    @post = @user.posts.find(params[:id])
  end

  private
  def user
    @user ||= User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
