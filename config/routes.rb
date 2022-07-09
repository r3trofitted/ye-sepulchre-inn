Rails.application.routes.draw do
  resources :games, only: :show do
    get "join", to: "players#create", as: "join"
    resources :players, only: :create
  end
end
