class TodoPolicy < ApplicationPolicy
  def permitted_attributes
      [:description]
  end

  def create?
    user.present?
  end
  def destroy?
    user.present?
  end
end