class UsersController < ApplicationController
  
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    @user = current_user
    @user_friends = current_user.friends
  end
  
end
