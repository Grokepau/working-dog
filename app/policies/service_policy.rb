class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def show?
    true
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
