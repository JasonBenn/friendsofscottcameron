Rails.application.routes.draw do
  get 'bio' => 'pages#bio'
  get 'platform' => 'pages#platform'
  get 'issues' => 'pages#issues'
  get 'donate' => 'pages#donate'
  get 'share' => 'pages#share'

  root 'pages#bio'

end
