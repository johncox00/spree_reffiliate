module Spree
  CheckoutController.class_eval do
    def update
      if @order.update_from_params(params, permitted_checkout_attributes)
        persist_user_address
        attach_refferal
        unless @order.next
          flash[:error] = @order.errors.full_messages.join("\n")
          redirect_to checkout_state_path(@order.state) and return
        end

        if @order.completed?
          session[:order_id] = nil
          flash.notice = Spree.t(:order_processed_successfully)
          flash[:commerce_tracking] = "nothing special"
          redirect_to completion_route
        else
          redirect_to checkout_state_path(@order.state)
        end
      else
        render :edit
      end
    end

    def attach_refferal
      if session[:referral]
        a = Affiliate.find_by_token(:code, session[:referral])
        if a
          r = Referral.where(affiliate: a, order: self).first
          unless r
            Referral.create!(affiliate: a, order: self)
          end
        end
      end
    end
  end
end