require "rails_helper"

RSpec.describe Pool, type: :model do
  it { should belong_to :user }
end
