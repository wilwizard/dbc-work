class UsersController < ApplicationController
  before_filter :load_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
  end

  def index
  end


  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user)
      login(@user)
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private
  def load_user
    @user = User.find(params[:id])
  end
end
