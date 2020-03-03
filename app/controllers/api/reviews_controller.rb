class Api::ReviewsController < ApplicationController

  before_action :authenticate_user

  def show
    @review = Review.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @review = Review.new(
      evaluator_id: current_user.id,
      actor_id: params[:actor_id],
      text: params[:text]  
    )
    if @review.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find(params[:id])

    @review.text = params[:text] || @review.text
   

    if @review.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render json: {message: "Review successfully destroyed"}
    
  end
end
