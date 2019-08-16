class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    if record.user == user || record.course.user == user
      return true
    else
      redirect_to root_path
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
