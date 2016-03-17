require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:votable) }

  context do
    before { User.new(id: 1).save validate: false }

    before { subject.user_id = 1 }

    it { should validate_uniqueness_of(:user_id).scoped_to([:votable_id, :votable_type]) }
  end

  it { should define_enum_for(:kind).with([:like, :dislike]) }

  it { should validate_presence_of :user }
end
