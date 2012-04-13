class ApplicationsController < ApplicationController
  load_resource :room
  authorize_resource :room, only: :index
  load_resource :application

  def index
    @applications = @room.applications
  end

  def new
    @application = Application.new
  end

  def create
    @application = @room.applications.create(params[:application].merge(user_id: current_user.id))

    if @application.persisted?
      @room.contacts.each do |user|
        UserMailer.application_notification(user.id, @application.id).deliver!
      end

      redirect_to room_application_path(@room, @application)
    else
      render :new
    end
  end

  def show
  end

  def disable
    @application.update_attribute(:disabled, true)
    redirect_to room_applications_path(@room)
  end
end
