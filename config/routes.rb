Rails.application.routes.draw do
  devise_for :suppliers
  devise_for :users

  root to: "styles#index"
  resources :styles ,only: [:index, :new, :create, :show, :search]
  get 'search' => 'styles#search'
end
