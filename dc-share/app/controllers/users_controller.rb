class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "会員登録が完了しました"
    else
      render 'new'
    end
  end
  
  def show

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:account_name, :email, :password,
                                 :password_confirmation, :location, :job, :year, :month, :day)
  end
end
