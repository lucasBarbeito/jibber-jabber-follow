Rails.application.routes.draw do
  # resources :follows
  get '/', to: 'follows#index'
end
