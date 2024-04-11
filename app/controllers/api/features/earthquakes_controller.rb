class Api::Features::EarthquakesController < ApplicationController
    def index
        @response = Earthquake.all()

        render json: {data:@response, message: "List of latest earthquakes"}, status: 200
    end

    def show 
        @response = Earthquake.find(params[:id])
        render json:{data: @response, message: ""}, status: 200
    end
end
