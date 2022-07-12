Rails.application.routes.draw do
  get '/', to: 'follows#index'
  post '/:id', to: 'follows#toggle'
  get '/:id', to: 'follows#show'
end
