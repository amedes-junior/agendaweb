class ContactPolicy < ApplicationPolicy

  def create?
     user.admin? || user.user?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.user?
  end

  def edit?
    update?
  end

  def show?
    user.admin? || user.user?
  end


  def destroy?
    user.admin? || ( record.user.id == user.id )
  end

  def export?
    true
  end

  def dashboard
    true 
  end



end
