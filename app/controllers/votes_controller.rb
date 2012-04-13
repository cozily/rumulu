class VotesController < ApplicationController
  load_and_authorize_resource :room
  load_resource :application

  def create
    @vote = @application.votes.create(accepted: params[:accepted], user_id: current_user.id)

    if @vote.persisted?
      @room.contacts.each do |user|
        UserMailer.vote_notification(user.id, @vote.id).deliver! unless user == current_user
      end
      render json: {:content => render_to_string(partial: "applications/vote", locals: {application: @application})}
    else
      render json: {:errors => @vote.errors.full_messages}
    end
  end
end
