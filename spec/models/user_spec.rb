require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should define_enum_for(:gender).with([:man, :woman]) }

  describe '.values_for_roles' do
    subject { User.values_for_roles }

    it do
      should eq [:administrator, :moderator, :user]
    end
  end

  it { should have_attached_file :avatar }

  it { should have_one(:auth_token).dependent(:destroy) }

  it { should have_many(:rooms).through(:memberships) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }

  it { should have_many(:pings).dependent(:destroy) }

  it { should have_many(:purchases).dependent(:destroy) }

  it { should have_many(:orders).dependent(:destroy) }

  it { should have_many(:comments).dependent(:destroy) }

  it do
    should have_many(:active_relationships).
      class_name('Relationship').
      with_foreign_key(:follower_id).
      dependent(:destroy)
  end

  it do
    should have_many(:passive_relationships).
      class_name('Relationship').
      with_foreign_key(:followee_id).
      dependent(:destroy)
  end

  it { should have_many(:followees).through(:active_relationships).source(:followee) }

  it { should have_many(:followers).through(:passive_relationships).source(:follower) }

  it do
    should validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/jpeg', 'image/jpg').
      rejecting('image/gif', 'application/pdf')
  end

  it { should validate_presence_of :email }

  it { should_not allow_value('test').for(:email) }

  it { should allow_value('test@example.com').for(:email) }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should validate_presence_of :name }

  it { should validate_presence_of :gender }

  it { should_not allow_value('1234567').for(:phone) }

  it { should allow_value('+380681234567').for(:phone) }

  it { should allow_value(nil).for(:phone) }

  it { is_expected.to callback(:set_role).before(:create) }

  describe '#set_role' do
    before { subject.send :set_role }

    its(:roles) { should eq [:user ] }
  end

  describe '.search_by' do
    let(:relation) { double }

    before { expect(User).to receive(:all).and_return(relation) }

    context do
      it { expect { User.search_by }.to_not raise_error }
    end

    context do
      before { expect(relation).to receive(:with_roles).with('user') }

      it { expect { User.search_by 'role' => 'user' }.to_not raise_error }
    end
  end
end
