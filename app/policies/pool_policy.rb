class PoolPolicy < ApplicationPolicy
  def show?
    record.public_pool? || record.all_members.include?(user)
  end
end
