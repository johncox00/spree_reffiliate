module Spree
  class Referral < ActiveRecord::Base
    belongs_to :affiliate
    belongs_to :order

    validates_presence_of :order_id, :affiliate_id

    def amount
      order.amount
    end
  end
end
