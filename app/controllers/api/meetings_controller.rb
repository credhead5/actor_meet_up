class Api::MeetingsController < ApplicationController

  before_action :authenticate_user

  def index
    @meetings = current_user.meetings
    render "index.json.jb"
  end

  def show
    @meeting = Meeting.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @meeting = Meeting.new(
      seeker_id: current_user.id, 
      fulfiller_id: params[:fulfiller_id],
      address: params[:address],
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

    @meeting.address = params[:address] || @meeting.address
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
    @meeting.destroy
    render json: {message: "Meeting successfully destroyed"}
    
  end

end


