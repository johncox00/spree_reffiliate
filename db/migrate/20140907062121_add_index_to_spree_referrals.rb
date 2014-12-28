class AddIndexToSpreeReferrals < ActiveRecord::Migration
  def change
    add_index :spree_referrals, :order_id
    add_index :spree_referrals, :affiliate_id
    add_index :spree_afiliates, :user_id
  end
end
