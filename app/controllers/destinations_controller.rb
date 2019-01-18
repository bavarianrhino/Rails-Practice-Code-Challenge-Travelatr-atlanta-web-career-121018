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
