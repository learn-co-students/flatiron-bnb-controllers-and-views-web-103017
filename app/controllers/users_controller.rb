class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = 
    @user.listings.build()
  end

  def show
  end

  def edit
  end
end
