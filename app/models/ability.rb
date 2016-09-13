class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :author
      can :read, :all
      can :not, Notice
      can :create, Notice
      can :update, Notice, user_id: user.id
      can :destroy, Notice, user_id: user.id
    else
      can :read, :all
    end
  end
end
