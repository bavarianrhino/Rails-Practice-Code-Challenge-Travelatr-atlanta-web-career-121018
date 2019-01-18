class DestinationsController < ApplicationController

        def index
            @destinations = Destination.all
        end

        def show
            @destination = Destination.find(params[:id])
            @recent_posts = @destination.recent_posts
            @feature = @destination.feature_post
            @average_age = @destination.average_age
        end

        # has_many :posts
        # has_many :bloggers, through: :posts
        # belongs_to :destination
        # belongs_to :blogger
        #
        # def recent_posts
        #     self.posts.last(5)
        # end
        #
        # def feature_post
        #     self.posts.order(:likes).last
        # end
        #
        # def average_age
        #     ages = self.bloggers.map do |blogger|
        #         blogger.age
        #     end
        #     return average = (ages.inject(:+))/ages.count
        # end

        # <h1> Destinations Show </h1>
        #
        # <h2><%= @destination.name %></h2>
        #     <% @recent_posts.each do |post| %>
        #         <p>Post Name: <%= link_to post.title, post_path(post) %> Likes: <%= post.likes %></p><br />
        #     <% end %>
        #
        # <% if @feature.present? %>
        # <h3>Title: <%= link_to @feature.title, post_path(@feature) %> Likes: <%= @feature.likes %></h3>
        # <% end %>
        #
        # <h3>The average age of all the bloggers that have written about this destination are <%= @average_age %></h3>

        def new
            @destination = Destination.new
        end

        def create
            @destination = Destination.new(dest_params)
            redirect_to destination_path(@destination)
        end

        def edit
            @destination = Destination.find(params[:id])
        end

        def update
            @destination = Destination.find(params[:id])
            @destination.update(dest_params)
            redirect_to destination_path(@destination)
        end

        private
        def dest_params
            params.require(:destination).permit(:name, :country)
        end
    end
