class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create]
  before_action :correct_user?, :except => [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "GOOD"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :password, :password_digest)
  end

end
