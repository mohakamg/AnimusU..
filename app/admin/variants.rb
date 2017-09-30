ActiveAdmin.register Variant do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :variant_type, :category_id
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
      f.input :variant_type
    end
    f.actions
  end

end
