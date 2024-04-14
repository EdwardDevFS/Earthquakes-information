require_dependency Rails.root.join('app', 'handlers', 'features_handlers.rb').to_s

class EarthquakeDataService
    
    def self.get_features(mag_types, search)
        if mag_types.is_a?(String)
          mag_types = JSON.parse(mag_types) 
        end   
        @earthquakes_features = Earthquake.all()
        if !mag_types.empty?
            @earthquakes_features = @earthquakes_features.where(mag_type: mag_types)
        end
        if search
            @earthquakes_features = @earthquakes_features.where("title ILIKE ?", "%#{search}%")
        end
        return @earthquakes_features
    end

    def self.save_earthquake_data(features)
        features.each do |feature|
          next unless FeaturesHandlers.validate_feature(feature)
    
          external_id = feature['id']
          Earthquake.find_or_create_by(external_id: external_id) do |earthquake|
            earthquake.magnitude = feature['properties']['mag']
            earthquake.place = feature['properties']['place']
            earthquake.url = feature['properties']['url']
            earthquake.time = feature['properties']['time']
            earthquake.tsunami = feature['properties']['tsunami']
            earthquake.mag_type = feature['properties']['magType']
            earthquake.title = feature['properties']['title']
            earthquake.longitude = feature['geometry']['coordinates'][0]
            earthquake.latitude = feature['geometry']['coordinates'][1]
          end
        end
      end
  
  end
  
  