class ColorsController < InheritedResources::Base

  private

    def color_params
      params.require(:color).permit(:category_id, :color)
    end
end
