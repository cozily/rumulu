class UserMailer < ActionMailer::Base
  default :from => "Rumulu <mailer@rumulu.com>"

  def collaborator_notification(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "You've been added as a collaborator!")
  end

  def application_notification(user_id, application_id)
    @user = User.find(user_id)
    @application = Application.find(application_id)
    mail(to: @user.email, subject: "You just received a new application!")
  end

  def vote_notification(user_id, vote_id)
    @user = User.find(user_id)
    @vote = Vote.find(vote_id)
    mail(to: @user.email, subject: "One of your collaborators made a vote!")
  end
end
