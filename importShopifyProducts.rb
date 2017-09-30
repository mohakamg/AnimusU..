require 'csv'

csv_text = File.read('products.csv')
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  type = row["Type"]
  if Category.where(product_type: type).count == 0
    c = Category.new(product_type: type)
    c.save
  end
end

csv.each do |row|
  variant = row["Option1 Value"]
  if Variant.where(variant_type: variant).count == 0
    v = Variant.new(variant_type: variant)
    v.save
  end
end

csv.each do |row|
  handle = row["Handle"]
  title = row["Title"]
  if title == nil
    if Product.where(handle: handle).count > 0
      print "Old Entry"
      product = Product.where(handle: handle)[0]
      product.variants.append(row["Option1 Value"])
      product.image_url.append(row["Image Src"])
      product.save
    end
  else
    print "New Entry "
    p = Product.new(handle: handle, name: title, price: row["Variant Price"], avg_weight_gms: row["Variant Grams"], description: row["Body (HTML)"])
    c = Category.where(product_type: row["Type"])[0]
    p.category = c
    p.variants = []
    p.image_url = []
    p.tags = []
    p.variants.append(row["Option1 Value"])
    p.image_url.append(row["Image Src"])
    p.tags.append("Shopify")
    p.save
  end
end
