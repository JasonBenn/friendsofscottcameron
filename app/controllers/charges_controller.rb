class ChargesController < ApplicationController
  def create

    amount = params[:amount]

    customer = Stripe::Customer.create(
      email: params[:email],
      card: params[:id]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Donation to friendsofscottcameron.com',
      currency: 'usd'
    )

    email(subject: "Successful #{amount} donation to friendsofscottcameron!", body: "#{params[:email]} donated #{amount}.\n\n#{params.inspect}")
    render json: { success: true, message: "Thank you for your donation of #{amount}" }

  rescue Stripe:CardError: e
    email(subject: 'FriendofScottCameron bug: CardError!', body: "Card was declined.")
    render json: { success: false, message: "Card was declined." }
  rescue Stripe:InvalidRequestError: e
    email(subject: 'FriendofScottCameron bug: InvalidRequestError!', body: "Invalid parameters were supplied to Stripe's API.")
    render json: { success: false, message: "Invalid parameters were supplied to Stripe's API." }
  rescue Stripe:AuthenticationError: e
    email(subject: 'FriendofScottCameron bug: AuthenticationError!', body: "Authentication with Stripe's API failed (maybe you changed API keys recently?).")
    render json: { success: false, message: "Authentication with Stripe's API failed (maybe you changed API keys recently?)." }
  rescue Stripe:APIConnectionError: e
    email(subject: 'FriendofScottCameron bug: APIConnectionError!', body: "Network communication with Stripe failed.")
    render json: { success: false, message: "Network communication with Stripe failed." }
  rescue Stripe:StripeError: e
    email(subject: 'FriendofScottCameron bug: StripeError!', body: "An error has prevented your donation from succeeding.")
    render json: { success: false, message: "An error has prevented your donation from succeeding." }
  end
end
