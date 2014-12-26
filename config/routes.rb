Rails.application.routes.draw do
  devise_for :users,
    :controllers => {
      :omniauth_callbacks => "auth/omniauth_callbacks",
      :sessions => 'auth/sessions'
    },
    :path => '',
    :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get '/history' => 'main#history', as: :history
  get '/write' => 'main#write', as: :write

  post '/post' => 'main#create', as: :create
  put '/toggleEmail' => 'main#toggleEmail', as: :toggle_email
  delete '/destroy' => 'main#destroy', as: :destroy_user
  root 'main#index'
end
