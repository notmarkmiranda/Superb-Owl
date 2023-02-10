class Pool < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def editable?
    !locked? && !finalized? && active
  end

  def locked?
    return false unless lock
    Time.current > lock
  end

  def finalized?
    return false unless finalize
    Time.current > finalize
  end
end
