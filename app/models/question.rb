class Question < ApplicationRecord
  belongs_to :pool
  has_many :options
end
