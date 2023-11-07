Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  
  resources :car_forms do
    get 'user_car_forms', on: :collection
  end
  
  resources :admin do
    post 'attach_file', on: :member
    delete 'delete_attachment', on: :member
  end

  resources :quotations
  resources :quotation_items
end
