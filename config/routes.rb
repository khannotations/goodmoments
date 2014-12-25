Rails.application.routes.draw do
  devise_for :users,
    :controllers => {
      :omniauth_callbacks => "auth/omniauth_callbacks",
      :sessions => 'auth/sessions'
    },
    :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  post '/post' => 'main#create', as: :create
  get '/history' => 'main#history', as: :history
  get '/write' => 'main#write', as: :write
  root 'main#index'
end
