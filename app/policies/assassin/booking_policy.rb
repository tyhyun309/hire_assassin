class Assassin::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    # copy from Doug, double check function**
    def resolve
      assassin = Assassin.find_by(user_id: user.id)
      return assassin.bookings
    end
  end
end
