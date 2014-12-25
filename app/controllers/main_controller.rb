class MainController < ApplicationController
  before_action: authenticate_user!, only: 'protected'

  def index

  end

  def protected
    @current_user = current_user
  end
end
