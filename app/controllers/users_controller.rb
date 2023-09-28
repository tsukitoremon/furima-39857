class UsersController < ApplicationController

  def create
  @user = User.new(user_params)
  @model = Model.new
  if @user.save
      redirect_to root_path
    else
      render :'registrations/new', status: :unprocessable_entity
    end
end

def new
  @user = User.new
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to root_path
end

private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_yomi, :first_name_yomi, :birthday)
  end
end