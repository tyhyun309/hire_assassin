class AssassinPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
<<<<<<< HEAD
=======
  end

  def show?
    true
>>>>>>> master
  end
end
