class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @blogger = @post.blogger
    end

    # <h1> Posts Show </h1>
    #
    # <h3><%= @post.title %></h3>
    # <h3><%= @post.content.to_s %></h3>
    # <h3><%= @post.likes %></h3>
    #
    # <%= link_to @blogger.name, blogger_path(@blogger) %><br>
    # <%= link_to @post.destination.name, destination_path(@post) %><br>

    def new
        @post = Post.new
    end

    # <%= form_for @post do |f| %>
    #     <%= f.label :title %>:
    #     <%= f.text_area :title %><br />
    #
    #     <%= f.label :content %>:
    #     <%= f.text_field :content %><br />
    #
    #     <%= f.label :likes %>:
    #     <%= f.number_field :likes %><br />
    #
    #     <%= f.label :name %>:
    #     <%= f. collection_select(:blogger_id, Blogger.all, :id, :name) %><br />
    #
    #     <%= f.label :name %>:
    #     <%= f.collection_select(:destination_id, Destination.all, :id, :name) %><br />
    #
    #   <%= f.submit %>
    # <% end %>

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
