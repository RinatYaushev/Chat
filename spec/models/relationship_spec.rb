require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it { should belong_to(:follower).class_name('User').counter_cache(:followees_count) }

  it { should belong_to(:followee).class_name('User').counter_cache(:followers_count) }

  it { should validate_presence_of(:follower_id) }

  it { should validate_presence_of(:followee_id) }

  it { should validate_uniqueness_of(:follower_id).scoped_to(:followee_id) }

  context do
    let(:relationship) { stub_model Relationship, follower_id: 33, followee_id: 33 }

    subject { relationship.errors }

    before { relationship.valid? }

    its([:cannot_follow_self]) { should eq ['cannot follow yourself'] }
  end

  context do
    let(:relationship) { stub_model Relationship, follower_id: 33, followee_id: 34 }

    subject { relationship.errors }

    before { relationship.valid? }

    its([:cannot_follow_self]) { should eq [] }
  end
end
