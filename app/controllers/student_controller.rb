class StudentController < ApplicationController
  before_action :authenticate_user!
  # get '/student'
  def index
    @users = User.all
    # @user.each to
    render json: @users
  end
  # post '/student'
  def show
    @user = User.find_by_id(params[:id])
    render json: @user

  end

end
