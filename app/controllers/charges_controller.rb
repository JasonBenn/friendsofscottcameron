class ChargesController < ApplicationController
  def create

    amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => params[:email],
      :card  => params[:id]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Donation to friendsofscottcameron.com',
      :currency    => 'usd'
    )

    render json: { success: true, message: "Thank you for your donation of #{amount}" }

  rescue Stripe::CardError => e
    # Since it's a decline, Stripe::CardError will be caught
    render json: { success: false, message: "Card was declined." }
  rescue Stripe::InvalidRequestError => e
    # Invalid parameters were supplied to Stripe's API
    render json: { success: false, message: "Invalid parameters were supplied to Stripe's API." }
  rescue Stripe::AuthenticationError => e
    # Authentication with Stripe's API failed
    # (maybe you changed API keys recently)
    render json: { success: false, message: "Authentication with Stripe's API failed." }
  rescue Stripe::APIConnectionError => e
    # Network communication with Stripe failed
    render json: { success: false, message: "Network communication with Stripe failed." }
  rescue Stripe::StripeError => e
    # Display a very generic error to the user, and maybe send
    # yourself an email
    render json: { success: false, message: "An error has prevented your donation from succeeding." }
  end
end
