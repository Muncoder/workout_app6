Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :workouts

  get 'members' => "dashboards#members"

  resources :friendships, only: [:create, :destroy]

  get 'my_dashboard' => "dashboards#my_dashboard"
  get 'user_dashboard' => "dashboards#user_dashboard"

end