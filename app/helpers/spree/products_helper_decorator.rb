Spree::ProductsHelper.module_eval do
  def product_price(product)
    if product.special_pricing
      "<span class='special-price'>Special Price</span>".html_safe
    else
      number_to_currency product.price
    end
  end
end
