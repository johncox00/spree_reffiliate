class CreateSpreeReferrals < ActiveRecord::Migration
  def change
    create_table :spree_referrals do |t|
      t.integer :order_id
      t.integer :affiliate_id
      t.timestamps
    end
  end
end
