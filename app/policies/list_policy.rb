class ListPolicy < ApplicationPolicy
  def permitted_attributes
    if user.owner_of?(list)
      [:name]
    end
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def destroy?
    user.present?
  end

end