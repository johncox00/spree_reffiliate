module Spree
  class Affiliate < ActiveRecord::Base
    
    tokenizable

    belongs_to :user, class_name: Spree.user_class.to_s 
    has_many :referrals
    
    validates_presence_of :path

    after_create :create_code

    def referred_orders
      referrals.map(&:order)
    end

    def referred_count
      referrals.count
    end

    private

      def create_code
        add_token(:code, size: 8)
      end

  end
end
