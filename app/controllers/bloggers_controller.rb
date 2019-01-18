class BloggersController < ApplicationController

        def index
            @bloggers = Blogger.all
        end

        def show
            @blogger = Blogger.find(params[:id])
            @posts = @blogger.posts
            @feature = @blogger.feature_post
        end

        # MODELS
        # has_many :posts
        # has_many :destinations, through: :posts
        # belongs_to :destination
        # belongs_to :blogger
        #
        # def feature_post
        #     if self.posts.present?
        #         self.posts.order(:likes).last
        #     end
        # end


        # VIEWS
        # <h1> Blogger Show </h1>
        #
        # <h2><%= @blogger.name %></h2>
        #     <% @posts.each do |post| %>
        #         <p>Post Name: <%= link_to post.title, post_path(post) %> Likes: <%= post.likes %></p><br />
        #     <% end %>
        #
        # <% if @feature.present? %>
        # <h3>Title: <%= link_to @feature.title, post_path(@feature) %> Likes: <%= @feature.likes %></h3>
        # <% end %>

        def new
            @blogger = Blogger.new
        end

        # <h1>Create New Blogger</h1>

        # <%= form_for @blogger do |f| %>
            # <%= f.label :name %>:
            # <%= f.text_field :name %><br />

            # <%= f.label :bio %>:
            # <%= f.text_area :bio %><br />

            # <%= f.label :age %>:
            # <%= f.number_field :age %><br />

            # <%= f.submit %>
        # <% end %>

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
