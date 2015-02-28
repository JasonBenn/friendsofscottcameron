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
    render json: { success: false, message: e.message }
  end
end
