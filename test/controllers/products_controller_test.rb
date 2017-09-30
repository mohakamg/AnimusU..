require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { avg_weight_gms: @product.avg_weight_gms, brand: @product.brand, categories_id: @product.categories_id, color: @product.color, description: @product.description, exchange_price: @product.exchange_price, handle: @product.handle, image_url: @product.image_url, material: @product.material, name: @product.name, price: @product.price, product_reference_url: @product.product_reference_url, rentable: @product.rentable, rentable_down_deposit: @product.rentable_down_deposit, rentable_per_month_price: @product.rentable_per_month_price, sale_price: @product.sale_price, service_provider: @product.service_provider, service_type: @product.service_type, tags: @product.tags, variant_SKU: @product.variant_SKU, variants: @product.variants, vendor: @product.vendor, visible: @product.visible } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { avg_weight_gms: @product.avg_weight_gms, brand: @product.brand, categories_id: @product.categories_id, color: @product.color, description: @product.description, exchange_price: @product.exchange_price, handle: @product.handle, image_url: @product.image_url, material: @product.material, name: @product.name, price: @product.price, product_reference_url: @product.product_reference_url, rentable: @product.rentable, rentable_down_deposit: @product.rentable_down_deposit, rentable_per_month_price: @product.rentable_per_month_price, sale_price: @product.sale_price, service_provider: @product.service_provider, service_type: @product.service_type, tags: @product.tags, variant_SKU: @product.variant_SKU, variants: @product.variants, vendor: @product.vendor, visible: @product.visible } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
