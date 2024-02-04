class PostsController < ApplicationController
    class PostsController < ApplicationController
        
        before_action :authenticate_user!, except: [:index, :show]
        def show
            @post = Post.find(params[:id]) 
        end
        def update
            @post = Post.find(params[:id])
            if @post.update(post_params)
                redirect_to @post
            else
                render :edit
            end
        end
        def destroy
            @post = Post.find(params[:id]) 
            @post.destroy
            redirect_to root_path
        end
        def index
            @posts=Post.all
        end
        def new
            @post = Post.new
        end
        def create
            @post = Post.new(post_params)
            if @post.save
              redirect_to @post
            else
              render :new
            end
          end
          def edit
            @post = Post.find(params[:id]) 
        end
          private
        def post_params
            params.require(:post).permit(:title, :body)
        end
def authenticate_user! 
    redirect_to new_user_session_path, alert: "SIGN IN TO CONTINUE" unless user_signed_in?
end
    end
end
