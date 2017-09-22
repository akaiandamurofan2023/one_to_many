class CommentsController < ApplicationController
before_action :authenticate_user!
	def create
	  @post = Post.find(params[:post_id])
	  @comment = current_user.comments.build(body: params[:comment][:body],post_id:@post.id)
	  if @comment.save 
	    redirect_to post_url(@post), notice: "コメントしました"
	  else
	    redirect_to post_url(@post), notice: "コメントできません"
	  end
	end

	def destroy
	  @post = Post.find(params[:post_id])
	  comment = @post.comments.find(params[:id])
	  comment.destroy

	  if comment.destroy
	  redirect_to post_url(params[:post_id]), notice: "コメントを削除しました"
	  else
	    redirect_to post_url(@post), notice: "コメント削除できません"
	  end
	end
end
