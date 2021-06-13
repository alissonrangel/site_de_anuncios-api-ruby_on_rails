class Ad < ApplicationRecord
  belongs_to :category
  has_one_attached :featured_image
  belongs_to :user, optional: false
end
