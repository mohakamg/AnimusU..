class VariantsController < InheritedResources::Base

  private

    def variant_params
      params.require(:variant).permit(:variant_type, :category_id)
    end
end
