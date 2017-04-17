class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
if params[:format].present?
    @pin = Pin.find(params[:format])
  else
    @pin = @pin
  end
  end
  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    result = Braintree::Transaction.sale(
     :amount => params[:checkout_form][:amount],
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
        @pin = Pin.find(params[:checkout_form][:post_id].to_i)
        @pin.purchases.create(buyer_id: current_user.id, store_id: @pin.user_id)

      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
    @pin = Pin.find(params[:checkout_form][:post_id].to_i)
    redirect_to braintree_new_path(@pin), :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
