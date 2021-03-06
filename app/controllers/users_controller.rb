# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: %i[home new create login]

  def home; end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
    @user.dogs.build
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user&.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/', alert: 'Login failed, incorrect Username or Password'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def logout
    session.destroy
    redirect_to '/'
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:username, :password, :qualification,
                                 dogs_attributes: %i[name age description breed_id])
  end
end
