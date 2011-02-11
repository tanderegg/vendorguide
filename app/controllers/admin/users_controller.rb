class Admin::UsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @users = User.find(:all)
  end
end
