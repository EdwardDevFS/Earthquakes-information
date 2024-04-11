class Earthquake < ApplicationRecord
    validates :place, presence: true
    validates :url, presence: true
    validates :mag_type, presence: true
    validates :title, presence: true
    validates :longitude, presence: true
    validates :latitude, presence: true
end
