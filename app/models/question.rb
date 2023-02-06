class Question < ApplicationRecord
  belongs_to :pool
  has_many :options

  accepts_nested_attributes_for :options
end
