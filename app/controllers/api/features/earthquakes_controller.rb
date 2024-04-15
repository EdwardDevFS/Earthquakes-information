require 'kaminari'
require_dependency Rails.root.join('app', 'services', 'earthquake_data_service.rb').to_s

class Api::Features::EarthquakesController < ApplicationController
    def index
        @earthquakes_features = EarthquakeDataService.get_features(params[:mag_types] ,params[:search])
        @response = CommonsHandlers.paginate(@earthquakes_features, params[:per_page], params[:page],@earthquakes_features.count)
        
        render json: {
            data: @response,
            message: "List of latest earthquakes"
        }, status: 200
    end

    # def show 
    #     @response = Earthquake.find(params[:id])
    #     render json:{data: @response, message: ""}, status: 200
    # end
end
