class Artist < ApplicationRecord
  belongs_to :billboard
  has_many :songs, dependent: :destroy
end
