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
      allowed_tags = %w[strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins]
      @post.body = ActionController::Base.helpers.sanitize(@post.body, tags: allowed_tags, attributes: [])
        @categories = Category.all
      end
      
  
    def update
      @post = Post.find(params[:id])
      
      allowed_tags = %w[strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins]
      @post.body = ActionController::Base.helpers.sanitize(@post.body, tags: allowed_tags, attributes: [])
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
      @delete = true
      @posts = Post.all
        @post = Post.new
        
      allowed_tags = %w[strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins]
      @post.body = ActionController::Base.helpers.sanitize(@post.body, tags: allowed_tags, attributes: [])
        @categories = Category.all
      end
      
  
      def create
        @post = Post.new(post_params.merge(author: current_user.email))
        
      allowed_tags = %w[strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins]
      @post.body = ActionController::Base.helpers.sanitize(@post.body, tags: allowed_tags, attributes: [])
        if @post.save
          redirect_to @post
        else
          flash[:alert] = "Error creating post"
          render :new, categories: :category_id, post: @post
        end
      end
      
    def edit
      @post = Post.find(params[:id])
      
      allowed_tags = %w[strong em b i p code pre tt samp kbd var sub sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr acronym a img blockquote del ins]
      @post.body = ActionController::Base.helpers.sanitize(@post.body, tags: allowed_tags, attributes: [])
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
  