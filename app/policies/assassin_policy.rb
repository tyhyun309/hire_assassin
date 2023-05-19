class AssassinPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def create?
    true
  end

  private

  def user_is_owner?
    record.user == user
  end
end
