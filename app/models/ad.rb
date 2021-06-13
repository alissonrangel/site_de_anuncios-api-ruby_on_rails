class Ad < ApplicationRecord
  has_one :category
  has_one_attached :featured_image
  belongs_to :user, optional: false
end
