class MessagesController < ApplicationController
  # load_and_authorize_resource :room
  load_resource :application

  def create
    message = @application.messages.create(params[:message].merge(user_id: current_user.id))

    if message.persisted?
      render json: {:content => render_to_string(partial: "message", locals: {message: message})}
    else
      render json: {:errors => message.errors.full_messages}
    end
  end
end
