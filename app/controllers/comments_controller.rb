class CommentsController < ApplicationController
	before_action :set_post, :set_user, only: %i[new create]
	def new
		@comment = Comment.new
		render :new
	end
	
	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		puts "comment_params: #{@comment_params}"
		puts "current_user: #{@current_user}"

		if @comment.save
			flash[:success] = 'Comment was successfully created.'
			redirect_to user_post_path(@user, @post)
		else
			flash.now[:error] = 'Comment could not be created.'
			render :new
		end
	end

	private

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_user
		@user = User.find(params[:user_id])
	end

	def comment_params
		@comment_params = params.require(:comment).permit(:text)
	end
end
