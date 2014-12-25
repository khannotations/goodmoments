Rails.application.routes.draw do
  devise_for :users

  devise_for :users,
    :controllers => {
      :omniauth_callbacks => "auth/omniauth_callbacks",
    #   :sessions => 'auth/sessions'
    },
    :path => '',
    :path_names => {:sign_in => 'join', :sign_out => 'classroom/logout'}

  '/protected' to: 'main#protected'
  root to: 'main#index'
end
