class UsersController < ApplicationController
  before_action :login_no,      only: :show
  before_action :already_login, only: [:new, :create]

  def new  #登録ページ
    @user = User.new
  end

  def show #詳細ページ
    
  end

  def create #post 
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path, notice: "create account!!"
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
