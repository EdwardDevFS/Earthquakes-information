
class FeaturesHandlers
    
  def self.validate_feature(feature)
    feature.dig('properties', 'title').present? &&
    feature.dig('properties', 'url').present? &&
    feature.dig('properties', 'place').present? &&
    feature.dig('properties', 'magType').present? &&
    feature.dig('geometry', 'coordinates', 0).present? &&
    feature.dig('geometry', 'coordinates', 1).present?
  end



end

