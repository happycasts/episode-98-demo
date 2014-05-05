class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.from_auth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
