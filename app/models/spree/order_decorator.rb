module Spree
  Order.class_eval do
    has_one :referral
    has_one :affiliate, through: :referral, foreign_key: :affiliate_id

    attr_accessor :referral_code, :affiliate_code

    after_create :create_referral
    #after_create :referral_affiliate_check

    def referred_by
      referral ? referral.affiliate.user : nil
    end

    def referred?
      !referral.nil?
    end

    def create_referral
      if session[:referral]
        a = Affiliate.find_by_token(:code, session[:referral])
        if a
          Referral.create!(affiliate: a, order: self)
        end
      end
    end
  end
end
