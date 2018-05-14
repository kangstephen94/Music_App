class UsersController < ApplicationController


  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url
    else
      flash[:errors] = ['Input a valid username and password']
      render :new
    end

  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end

end
