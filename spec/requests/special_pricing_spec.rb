require 'spec_helper'

describe 'special pricing' do
  let!(:product) {
    Spree::Product.create!(
      :name => 'Shirt',
      :price => 12.99,
      :available_on => 1.day.ago)
  }

  it 'should hide price of item on home page' do
    visit '/'

    page.should have_content(product.name)
    page.should_not have_content('12.99')
    page.should have_content('Special Price')
  end

  it 'should hide price of item of product page' do
    visit spree.product_path(product)

    page.should have_content(product.name)
    page.should_not have_content('12.99')
    page.should have_content('Special Price')
  end

  it 'should show price of item in the cart' do
    visit spree.product_path(product)
    click_on 'Add To Cart'

    page.should have_content(product.name)
    page.should have_content('12.99')
    page.should_not have_content('Special Price')
  end
end
