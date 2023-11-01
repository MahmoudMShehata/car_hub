Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :car_forms, only: [:new, :create]
  
  resources :admin do
    post 'attach_file', on: :member
    delete 'delete_attachment', on: :member
  end

  resources :quotations
  resources :quotation_items
end
