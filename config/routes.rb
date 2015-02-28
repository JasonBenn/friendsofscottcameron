Rails.application.routes.draw do
  get 'bio' => 'pages#bio'
  get 'platform' => 'pages#platform'
  get 'issues' => 'pages#issues'
  get 'donate' => 'pages#donate'
  post 'charge' => 'payments#charge'
  get 'share' => 'pages#share'

  resources :charges

  root 'pages#bio'

end
