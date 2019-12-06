class Billboard < ApplicationRecord
  belongs_to :user
  has_many :artists, dependent: :destroy
end
