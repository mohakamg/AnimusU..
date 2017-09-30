class CategoriesController < InheritedResources::Base

  private

    def category_params
      params.require(:category).permit(:product_type, :category_image_url, :category_upload)
    end
end
