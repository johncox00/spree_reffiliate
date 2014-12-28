module Spree
  User.class_eval do
    has_one :affiliate

    #attr_accessor :referral_code, :affiliate_code

    after_create :create_referral
    #after_create :referral_affiliate_check
    
    def referred_count
      affiliate.referrals.count
    end

    def affiliate?
      !affiliate.nil?
    end

    # private
    #   def referral_affiliate_check
    #     if !self.referral_code.nil?
    #       referred = Referral.find_by(code: referral_code)
    #     elsif !self.affiliate_code.nil?
    #       referred = Affiliate.find_by(path: affiliate_code)
    #     end
    #     if referred
    #       referred.referred_records.create(user: self)
    #     end
    #   end
  end
end
