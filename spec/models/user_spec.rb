require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of :email }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of :name }

  it { should have_one(:auth_token).dependent(:destroy) }

  it { should have_many(:rooms).through(:memberships) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }

  it { should have_many(:pings).dependent(:destroy) }

  it { should have_attached_file :avatar }

  it do
    should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/jpeg', 'image/jpg').
      rejecting('image/gif', 'application/pdf')
  end
end
