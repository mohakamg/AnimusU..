ActiveAdmin.register Color do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :color, :category_id
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs do
      #f.file_input :product_images
      f.input :category, collection: Category.pluck(:product_type, :id)
      f.input :color, as: :string
    end
    f.actions
  end

end
