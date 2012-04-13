class CollaboratorsController < ApplicationController
  load_and_authorize_resource :room

  def create
    user = User.find_or_initialize_by_email(params[:collaborator][:user][:email])
    user.set_random_passwords if user.new_record?

    if user.persisted? or user.save
      unless @room.collaborators.any? {|c| c.user == user}
        @room.collaborators.create(user: user)
        UserMailer.collaborator_notification(user.id).deliver!
        render json: {:content => render_to_string(partial: "collaborator", locals: {user: user})}
      else
        render nothing: true
      end
    else
      render json: {:errors => user.errors.full_messages}
    end
  end
end
