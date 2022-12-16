class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show edit update destroy ]
  before_action :set_tutor
  before_action :authenticate_user!
  #before_action :set_time_zone, if: :user_signed_in?


  # GET /meetings or /meetings.json
  def index
    @meetings = Meeting.all
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end


  # GET /meetings/1 or /meetings/1.json
  def show
    id = params[:id]
    @meeting = Meeting.find params[:id]
    @meeting.user_id = current_user.id
    @meeting.tutor_id = @tutor.id

  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find params[:id]
    @meeting.user_id = current_user.id
    @meeting.tutor_id = @tutor.id

  end

  # POST /meetings or /meetings.json
  def create
    @tutor = Tutor.find(params[:tutor_id])
    @meeting = @tutor.meetings.build(meeting_params)

    @meeting.user_id = current_user.id
    @meeting.tutor_id = @tutor.id

    respond_to do |format|
      if @tutor.save
        format.html { redirect_to (@tutor), notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    @meeting = Meeting.find params[:id]
    @meeting.user_id = current_user.id
    @meeting.tutor_id = @tutor.id

    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to tutor_meeting_path, notice: "Meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.user_id = current_user.id
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to @tutor, notice: "Meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:title, :description, :start_time, :end_time, :meeting_location, :meeting_online_link)
    end

    def set_tutor
      @tutor = Tutor.find(params[:tutor_id])
    end

end
