Rails.application.routes.draw do
  get "/home" => "home#index"

  devise_scope :user do
    root "devise/sessions#new"
  end
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  post "message", to: "messages#create"

  resources :groups, only: [:show, :index], param: :group_id do
    collection do
      get :subscriptions
    end
  end

  resources :subscriptions, only: [:destroy], param: :group_id

  mount ActionCable.server, at: "/cable"
end
