require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should validate_presence_of :user }

  it { should validate_presence_of :room }

  it { should belong_to(:user) }

  it { should belong_to(:room) }
end
