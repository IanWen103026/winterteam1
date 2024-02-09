class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    # POST /posts/:post_id/comments
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        # Handle errors if comment creation fails
        redirect_to @post, alert: 'Failed to create comment.'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  