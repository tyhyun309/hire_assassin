class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    # scope.all
      scope.where(user: user) # If users can only see their bookings
    end
  end
end
