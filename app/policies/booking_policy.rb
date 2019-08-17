class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    if record.user == current_user || record.course.user == current_user
      return true
    else
      return false
    end
  end

  def create?
    # we may need to edit this for the modal login authorization
    true
  end

  # TODO?
  def update?
    true
    # record.user == user
  end

  def destroy?
    record.user == user
  end
end
