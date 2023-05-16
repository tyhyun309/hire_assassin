class Assassin::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    # copy from Doug, double check function**
    def resolve
      user.bookings_as_assassin
    end
  end
end
