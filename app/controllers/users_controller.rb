class UsersController < ApplicationController
  
  before_filter :authenticate
  
  def show
	@user = User.find(params[:id])
  end
  
  def new
	@user = User.new
	@title = "Sign up"
  end

  def create
	@user = User.new(params[:user])
	if @user.save
		sign_in @user
		flash[:success] = "Welcome to PianoDude!"
		redirect_to @user
	else
		@title = "Sign up"
		render 'new'
	end
  end
  
  def authenticate
	deny_access unless signed_in?
  end
  
end
