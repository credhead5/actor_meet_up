class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      bio: params[:bio],
      
    )
    if @user.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    @user.bio = params[:bio] || @user.bio

    if @user.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "User successfully destroyed"}
    
  end

end
