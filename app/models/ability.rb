class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.persisted?
      can :create, Room
      can :manage, Room do |room|
        room.user_id == user.id || room.collaborators.map(&:user_id).include?(user.id)
      end
      can :create, Application
      can :manage, Application, :user_id => user.id

      can :read, Application do |application|
        application.user_id == user.id || application.room.user_id = user.id || application.room.collaborators.map(&:user_id).include?(user.id)
      end
    else
      can :read, Room
    end
  end
end
