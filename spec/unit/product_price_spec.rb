require 'spec_helper'

describe Spree::ProductsHelper do
  let(:helper) {
    Object.new.extend Spree::ProductsHelper
  }

  let(:product) { mock('product') }

  describe '#product_price' do
    it 'returns formatted product price if there is no special pricing' do
      raw_price = 12.99
      formatted_price = '$12.99'

      product.stub(:special_pricing).and_return(false)
      product.stub(:price).and_return(raw_price)

      helper.stub(:number_to_currency).with(raw_price).
        and_return(formatted_price)

      helper.product_price(product).should == formatted_price
    end

    it 'returns special price text if there is special pricing' do
      product.stub(:special_pricing).and_return(true)

      helper.product_price(product).should ==
        "<span class='special-price'>Special Price</span>"
    end
  end
end
