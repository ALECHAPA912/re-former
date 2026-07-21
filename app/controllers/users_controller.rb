class UsersController < ApplicationController
  def new
  end

  # app/controllers/users_controller.rb
  def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
