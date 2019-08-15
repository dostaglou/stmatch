class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def create?
    # we may need to edit this for the modal login authorization
    true
  end

  # TODO?
  # def update?
  #   record.user == user
  # end

  # def destroy?
  #   record.user == user
  # end
end
