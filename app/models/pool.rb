class Pool < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def locked?
    Time.current > lock
  end
end
