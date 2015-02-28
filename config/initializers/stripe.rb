# TODO: stash these in the environment with that gem thing.
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_E1SMWXgfw5xBodu6wQBOXfLi',
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => 'sk_test_Y0hGbAehHVWL45SDM3PiLk0H'
  # :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
