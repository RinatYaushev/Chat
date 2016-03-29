require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of :email }

  it { should_not allow_value('test').for(:email) }

  it { should allow_value('test@example.com').for(:email) }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of :name }

  it { should allow_value('+380681234567').for(:phone) }

  it { should_not allow_value('1234567').for(:phone) }

  it { should allow_value(nil).for(:phone) }

  it { should define_enum_for(:gender).with([:man, :woman]) }

  it { should validate_presence_of :gender }

  it { should have_one(:auth_token).dependent(:destroy) }

  it { should have_many(:rooms).through(:memberships) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }

  it { should have_many(:pings).dependent(:destroy) }

  it { should have_many(:purchases).dependent(:destroy) }

  it { should have_many(:orders).dependent(:destroy) }

  it { should have_many(:comments).dependent(:destroy) }

  it { should have_attached_file :avatar }

  it do
    should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/jpeg', 'image/jpg').
      rejecting('image/gif', 'application/pdf')
  end
end
