class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :'registrations/new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name,
                                 :last_name_yomi, :first_name_yomi, :birthday)
  end
end
