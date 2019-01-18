class BloggersController < ApplicationController

        def index
            @bloggers = Blogger.all
        end

        def show
            @blogger = Blogger.find(params[:id])
            @posts = @blogger.posts
            @feature = @blogger.feature_post
        end

        def new
            @blogger = Blogger.new
        end

        def create
            @blogger = Blogger.create(blog_params)
            redirect_to blogger_path(@blogger)
        end

        def edit
            @blogger = Blogger.find(params[:id])
        end

        def update
            @blogger = Blogger.find(params[:id])
            @blogger.update(blog_params)
            redirect_to blogger_path(@blogger)
        end

        private
        def blog_params
            params.require(:blogger).permit(:name, :bio, :age)
        end
    end
