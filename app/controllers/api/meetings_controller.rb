class Api::MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    render "index.json.jb"
  end

  def show
    @meeting = Meeting.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @meeting = Meeting.new(
      seeker_id: params[:seeker_id],
      fulfiller_id: params[:fulfiller_id],
      location: params[:location],
      start_time: params[:start_time],
      end_time: params[:end_time]  
    )
    if @meeting.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @meeting = Meeting.find(params[:id])

    @meeting.location = params[:location] || @meeting.location
    @meeting.start_time = params[:start_time] || @meeting.start_time
    @meeting.end_time = params[:end_time] || @meeting.end_time

    if @meeting.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @user.destroy
    render json: {message: "User successfully destroyed"}
    
  end

end


