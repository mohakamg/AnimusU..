class HomeController < ApplicationController
  def home_page
    # @category = Category.all
    @featured_products = Tag.where(tag: "Featured")[0].products.limit(15)
    # @featured_watches = Tag.where(tag: "Featured")[0].products.where(category: Category.where(product_type:"Watch")[0])
  end
end
