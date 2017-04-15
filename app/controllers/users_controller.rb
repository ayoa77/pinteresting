class UsersController < ApplicationController
def new
  @user = User.new
end
def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Thanks for signing up!"
  else
    render 'new'
end
def show
  byebug
  @user = User.find(params[:id])
  @pins = Pins.where(user_id: @user.id)
end
end




private

 def user_params
   params.require(:user).permit(:email, :password, :password_confirmation, :username, :address, :city, :country)
end
end
