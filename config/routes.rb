Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/rswag/api-docs', via: [:get]
  mount Rswag::Api::Engine => '/rswag/api-docs', via: [:get]

  get '/', to: 'follows#index'
  post '/:id', to: 'follows#toggle'
  get '/:id', to: 'follows#show'
end
