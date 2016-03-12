require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should validate_presence_of :user }

  it { should validate_presence_of :room }

  it { should validate_uniqueness_of(:user_id).scoped_to(:room_id) }

  it { should belong_to(:user) }

  it { should belong_to(:room) }
end
