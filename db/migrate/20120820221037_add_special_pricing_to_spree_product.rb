class AddSpecialPricingToSpreeProduct < ActiveRecord::Migration
  def change
    add_column :spree_products, :special_pricing, :boolean
  end
end
