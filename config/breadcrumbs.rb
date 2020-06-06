crumb :root do
  link "HOME", root_path
end

crumb :products do
  link "SELECT", products_path
  parent :root
end

crumb :womenproducts do
  link "WOMEN", indexOfWomenProducts_products_path
  parent :root
end

crumb :menproducts do
  link "MEN", indexOfMenProducts_products_path
  parent :root
end

crumb :product do |product|
  link product.namejap, product_path(product)
  parent :products, :womenproducts, :menproducts
end