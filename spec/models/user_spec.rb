require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of(:name).case_insensitive }

  it { should have_one(:auth_token).dependent(:destroy) }

  it { should have_many(:rooms).through(:memberships).dependent(:destroy) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }
end
