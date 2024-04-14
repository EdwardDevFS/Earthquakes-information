class Comment < ApplicationRecord
  belongs_to :earthquake
  validates :description, presence: true

end
