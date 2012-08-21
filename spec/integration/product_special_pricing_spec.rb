require 'spec_helper'

describe Spree::Product do
  describe '#special_pricing' do
    let(:product) {
      Spree::Product.create!(
        :name => 'Shirt',
        :price => 12.99,
        :available_on => 1.day.ago)
    }

    it 'should default to false' do
      product.special_pricing?.should be_false
    end

    it 'should be possible to set to true' do
      product.special_pricing = true
      product.save!
      product.reload.special_pricing?.should be_true
    end
  end
end
