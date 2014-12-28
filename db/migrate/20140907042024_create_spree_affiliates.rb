class CreateSpreeAffiliates < ActiveRecord::Migration
  def change
    create_table :spree_affiliates do |t|
      t.integer :user_id
      t.string :path
      t.string :code
      t.timestamps
    end
  end
end
