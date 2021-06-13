class AdsController < AuthorizationController 
  before_action :logged_in?, except: [:ads]

  def ads0
    @ads = Ad.all.order(:id).map do |ad|
      {        
        id: "#{ad.id}",
        image: ad.image,
        price: ad.price,
        desc: ad.desc,
        priceNegotiable: ad.priceNegotiable,
        title: ad.title        
      }
    end

    render json: { ads: @ads }
  end

  def index
    @ads = Ad.all.with_attached_featured_image

    render json: @ads.map { |ad|
      ad.as_json.merge({ featured_image: url_for(ad.featured_image) })
    }
  end

  def ads
    @ads = Ad.all.with_attached_featured_image.order(:id).map do |ad|
      {        
        id: "#{ad.id}",
        image: ad.image,
        price: ad.price,
        desc: ad.desc,
        priceNegotiable: ad.priceNegotiable,
        title: ad.title,
        featured_image: url_for(ad.featured_image)       
      }
    end

    render json: { ads: @ads }
  end

  def index
    @ads = Ad.all
    render json: { ads: @ads }
  end

  def create
    @ad = Ad.new(image: params[:image], featured_image: params[:featured_image], category_id: params[:cat], title: params[:title], desc: params[:desc], price: params[:price], priceNegotiable: params[:priceNegotiable])
    @ad.user = current_user
    #@ad = Ad.create(image: params[:image], featured_image: params[:featured_image], category_id: params[:cat], title: params[:title], desc: params[:desc], price: params[:price], priceNegotiable: params[:priceNegotiable])
    if @ad.save      
      render json: {                
        id: @ad.id
      }
    else
      render json: { error: 'Não foi possível criar o anúncio' }
    end
    # @ad = Ad.create(ad_params)
  end

  private

  def ad_params
    params.permit(:title, :image, :price, :priceNegotiable, :desc, :token, :cat, :featured_image)
  end
  # def book
  #   @booking_time = BookingTime.find_by(id: params[:booking_time_id])

  #   return render json: {error: "Horário não encontrado"} if @booking_time.blank?
  #   return render json: {error: "Esse horário já se encontra ocupado"} if @booking_time.booked?
  #   return render json: {error: "Você já possui horário marcado"} if current_user.has_booked_time?

  #   if @booking_time.update(user: current_user)
  #     render json: {
  #       success: true
  #       booking_time: @booking_time
  #     }
  #   else
  #     render json: {error: "Ocorreu algum erro"} 
  #   end
  # end

  # def cancel
  #   @booking_time = current_user.booking_time

  #   return render json: {error: "Você não possui nenhum horário para desmarcar"} if @booking_time.blank?

  #   if @booking_time.update(user: nil)
  #     render json: {
  #       success: true
  #       booking_time: @booking_time
  #     }
  #   else
  #     render json: {error: "Ocorreu algum erro"} 
  #   end
  # end

  # def current_booked_time
  #   render json: {current_booked_time: current_user.booking_time}
  # end
end