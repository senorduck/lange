class UsersController < ApplicationController
  layout "application"
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Acount created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "User information updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "This user can not perform this action"
      redirect_to(root_path)
    end
  end

end
