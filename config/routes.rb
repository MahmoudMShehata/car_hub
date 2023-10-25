Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :car_form, only: [:new, :create]
end
