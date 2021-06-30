Rails.application.routes.draw do
  get "/" => "users#new"

  post "/sessions" => "users#sessions"

  resources :users do
  end

  resources :shoes do
  end

  resources :trans do
  end

end
