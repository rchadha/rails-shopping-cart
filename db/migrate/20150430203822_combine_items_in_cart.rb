class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          #remove individual items
          cart.line_items.where(:product_id => product_id).delete_all
           #replace with single item
          cart.line_items.create(:product_id => product_id, :quantity=>quantity)
        end
      end
    end
  end

end
