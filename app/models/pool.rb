class Pool < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def editable?
    !locked? && !finalized? && active
  end

  def locked?
    Time.current > lock
  end

  def finalized?
    Time.current > finalize
  end
end
