Rails.application.routes.draw do
  get "/home" => "home#index"
  devise_scope :user do
    root "devise/sessions#new"
  end
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
end
