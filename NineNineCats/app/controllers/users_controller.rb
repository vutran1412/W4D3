class UsersController < ApplicationController

  before_action :require_logout, only: [:new, :create]
  
  def new
  end

  def create
  end
end
