class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]

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
      image_url: params[:image_url],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      
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
    @user = current_user

    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    @user.bio = params[:bio] || @user.bio
    @user.image_url = params[:image_url] || @user.image_url

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
