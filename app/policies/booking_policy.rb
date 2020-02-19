class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # I should see only bookings which belong to me
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

end
