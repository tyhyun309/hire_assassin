class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:) # If users can only see their bookings
    end
  end

  def update?
    user == record.user
  end

  def create?
    true
  end
end
