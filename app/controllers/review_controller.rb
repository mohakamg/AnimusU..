class ReviewController < ApplicationController
  
before_action :authenticate_user!, only: [:toggleLike, :createReview, :deleteReview]

  def getReviews
    product = Product.find(params[:product_id])
    @reviews = product.reviews
    @topReviews = product.reviews.where(:like => true).limit(5)
  end

  def toggleLike
    product = Product.find(params[:product_id])
    product_review = product.reviews.where(user: current_user)
    if product_review.count>0
      product_review = product_review[0]
      product_review.like = !product_review.like
    else
      product_review = product.reviews.new
      product_review.user = current_user
      product_review.like = true
    end
    product_review.save
    redirect_to product
  end

  def createReview
    product = Product.find(params[:product_id])
    product_review = product.review.where(user: current_user)
    if product_review.count == 0
      product_review = product.review.new
      product.review.user = current_user
    else
      product_review = product_review[0]
      product_review.comment = params[:comment]
    end
    product_review.save
    notice = "Comment Successfully Added"
    redirect_to product
  end

end
