module ProductsHelper

  def compare_product(id)
    @products = Product.where(article: id)
    if @products.present?
      return @products
    end
  end

  def compare_delivery_product(id)
    @delivery_products = DeliveryProduct.where(article: id)
    if @delivery_products.present?
      return @delivery_products
    end
  end
end
