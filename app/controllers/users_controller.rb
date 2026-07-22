class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User CREATED succesfully!"
    else
      flash.now[:alert] = "#{@user.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = select_user
  end

  def update
    @user = select_user
    if @user.update(user_params)
      redirect_to @user, notice: "User EDITED succesfully!"
    else
      flash.now[:alert] = "#{@user.errors.full_messages}"
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = select_user
  end

  def destroy
    @user = select_user
    if @user.destroy
      redirect_to users_path, notice: "User DELETED succesfully!"
    end
  end

  def user_params
    params.expect(user: [ :username, :email, :password ])
  end

  def select_user
    User.find(params[:id])
  end
end
