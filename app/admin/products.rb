ActiveAdmin.register Product do
  action_item :view_site do
    link_to "New Product (Use this one)", new_product_path
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :category_id,:name,:price,:sale_price,:description, :rentable, :rentable_per_month_price, :exchange_price, :rentable_down_deposit, :product_reference_url, :visible, :handle, :vendor, :material, :variant_SKU, :avg_weight_gms, :service_provider, :service_type, :brand, :tags, :image_url, :variants => [],:color => [], :product_images => []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column "name" do |p|
    link_to p.name, edit_product_path(p)
  end
  column :id
  column :category
  column :name
  column :price
  column :sale_price
  column :description
  column :rentable
  column :rentable_per_month_price
  column :rentable_down_deposit
  column :product_reference_url
  column :visible
  column :handle
  column :vendor
  column :material
  column :variant_SKU
  column :avg_weight_gms
  column :service_provider
  column :service_type
  column :brand
  column :image_url
  column :tags
  column :variants
  column :color
end

form do |f|
  f.inputs do
    f.input :product_images, as: :file, multipart: true
    f.input :category, collection: Category.pluck(:product_type, :id)
    f.input :name
    f.input :price
    f.input :sale_price
    f.input :description
    f.input :rentable
    f.input :rentable_per_month_price
    f.input :rentable_down_deposit
    f.input :product_reference_url
    f.input :visible
    f.input :handle
    f.input :vendor
    f.input :material
    f.input :variant_SKU
    f.input :avg_weight_gms
    f.input :service_provider
    f.input :service_type
    f.input :brand
    f.input :image_url
    f.input :tags
    f.input :variants, :as => :check_boxes, :collection => Variant.pluck(:variant_type, :id)
    f.input :color, :as => :check_boxes, :collection => Color.pluck(:color, :id)
  end
  f.actions
end

end
