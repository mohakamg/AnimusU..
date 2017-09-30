class ProductsController < InheritedResources::Base

  protect_from_forgery except: [:amazon_product]

  def create
    @product = Product.new(product_params)
    #byebug
    @product.tags = params[:product][:tags].split(",")
    @product.image_url = params[:product][:image_url].split(",")
    # @product.variants = params[:product][:tags][0].split(",")
    # @product.colors = params[:product][:tags][0].split(",")
    # @product.category = Category.where(product_type: params[:product][:category_id])[0]
    if @product.save
      notice = "Product Saved Successfully"
      redirect_to @product
    else
      notice = "Save Failed"
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    @product.tags = params[:product][:tags].split(",")
    byebug
    @product.image_url = params[:product][:image_url].split(",")
    if @product.save
      notice= "Successfully Updated Product"
      redirect_to @product
    else
      notice = "Failed to Update Prodcut"
      render :new
    end
  end

  def amazon_product
    price = params[:price].delete('$')
    title = params[:title]
    description = params[:description]
    brand = params[:brand]
    images = params[:images].split(',')
    reference_url = params[:reference_url]
    tags = params[:tags]
    p_type = params[:p_type]
    variants = params[:variants]
    # byebug
    p = Product.new(category: Category.where(product_type: p_type)[0], price: price, name: title, description: description, brand: brand, image_url: images, product_reference_url: reference_url)
    p.price = p.price-1
    p.tags = tags
    p.variants = variants
    p.rentable = true
    if p.price > 10 && p.price < 40
      p.rentable_per_month_price = p.price/36
    elsif p.price >= 40 && p.price < 80
      p.rentable_per_month_price = p.price/48
    elsif p.price >= 80 && p.price < 130
      p.rentable_per_month_price = p.price/54
    elsif p.price >= 130 && p.price < 200
      p.rentable_per_month_price = p.price/(6*12)
    else
      p.rentable_per_month_price = p.price/(7*12)
    end
    if p.save
      render html: 'Saved'
    else
      render html: 'Failed'
    end
  end

  def add_review
    review = params[:review]
    user = current_user
    product = Product.find(params[:id])

    r = product.reviews.where(user: user)
    if r.count == 0
      r = product.reviews.new
      r.user = user
      r.comment = review
      r.save
      redirect_to product
    else
      r[0].comment = review
      r[0].save
      redirect_to product
    end
  end


  private

    def product_params
      params.require(:product).permit(:category_id, :name, :price, :sale_price, :rentable, :description, :rentable_per_month_price, :exchange_price, :rentable_down_deposit, :product_reference_url, :visible, :handle, :vendor, :material, :variant_SKU, :avg_weight_gms, :service_provider, :service_type, :brand, :tags, :image_url, :product_images => [], :variants => [], :color => [])
    end
end
