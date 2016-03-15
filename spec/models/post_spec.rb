require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:room) }

  it { should validate_presence_of :room }
end
