Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :contacts do
    collection do
      get "export", action: :export, as: :export
      get "dashboard", action: :dashboard, as: :dashboard 
    end



  end

  resources :users

  root "contacts#index"


end
