class AdSerializer < ActiveModel::Serializer
  # attributes :id
  include Rails.application.routes.url_helpers
  attributes :id, :title, :image, :price, :priceNegotiable, :cat, :Authorization, :desc, :featured_image
  def featured_image
    if object.featured_image.attached?
      {
        url: rails_blob_url(object.featured_image)
      }
    end
  end
end