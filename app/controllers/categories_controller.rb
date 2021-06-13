class CategoriesController < AuthorizationController 
  
  def list
    @categories = Category.all.order(:id).map do |cat|
      {
        _id: "#{cat.id}",
        img: cat.img,
        name: cat.name,
        slug: cat.slug
      }
    end
    render json: { categories: @categories }
  end

end