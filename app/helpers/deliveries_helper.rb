module DeliveriesHelper

  def compare_product(id)
    @products = Product.where(article: id)

    # return @products
  end


end
