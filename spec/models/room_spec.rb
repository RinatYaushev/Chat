require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should validate_presence_of :name }

  it { should have_many(:users).through(:memberships).dependent(:destroy) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }
end
