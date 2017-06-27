class UserPolicy < ApplicationPolicy

  def create?
     user.admin? || user.user?
  end

  def new
    create?
  end

end
