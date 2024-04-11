namespace :earthquakes do
    desc 'Import and persist earthquake data from API'
    task :persist_information => :environment do
        require 'httparty'
        require_dependency Rails.root.join('app', 'services', 'earthquake_data_service.rb').to_s

        response = HTTParty.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
        result = JSON.parse(response.body)
        features = result['features']

        EarthquakeDataService.save_earthquake_data(features)
    end
end
