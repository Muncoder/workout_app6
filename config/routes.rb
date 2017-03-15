Rails.application.routes.draw do

  devise_for :users,
  		:path => '',
  		:path_name => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  		:controllers => {:omniauth_callbacks => 'omniauth_callbacks'}


  root "pages#home"

  resources :workouts do
    resources :reviews, only: [:create, :destroy]
  end

  get 'members' => "dashboards#members"

  resources :friendships, only: [:create, :destroy]

  get 'my_dashboard' => "dashboards#my_dashboard"
  get 'user_dashboard' => "dashboards#user_dashboard"

end