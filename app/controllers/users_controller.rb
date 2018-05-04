class UsersController < ApplicationController
  
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    @friendships = current_user.friends
  end
  
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      flash.now[:danger] = "No results found" if @friends.blank?
    else
      flash.now[:danger] = "Please enter a search string"
    end
    render partial: "friends/result"
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    if current_user.save
      flash[:success] = "#{@friend.first_name} was added to friends"
    else
      flash[:danger] = "There was a problem with the friend request"
    end
    redirect_to my_friends_path
  end
  
  def show
    @user = User.find([params[:id]]).first
    @user_stocks = @user.stocks
  end
  
end
