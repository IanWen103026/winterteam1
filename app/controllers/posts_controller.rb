class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    before_action :set_categories, only: [:new, :edit, :create]
    def index
      @posts = Post.all
      
      @categories = Category.all
    end
  
    def show
        @post = Post.find(params[:id])
        
      @posts = Post.all
        @categories = Category.all
      end
      
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        redirect_to @post
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to root_path
    end
  
    def new
        
      @posts = Post.all
        @post = Post.new
        @categories = Category.all
      end
      
  
      def create
        @post = Post.new(post_params.merge(author: current_user.email))
        if @post.save
          redirect_to @post
        else
          flash[:alert] = "Error creating post"
          render :new, categories: :category_id, post: @post
        end
      end
      
    def edit
      @post = Post.find(params[:id])
    end
  
    private
    def post_params
        params.require(:post).permit(:title, :body, :category_id)
    end
      
      
    def set_categories
        @categories = Category.all
      end
    def authenticate_user!
      redirect_to new_user_session_path, alert: "SIGN IN TO CONTINUE" unless user_signed_in?
    end
  end
  