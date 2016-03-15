require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:votable) }

  # pending { should validate_uniqueness_of(:user).scoped_to([:votable, :votable_type]) }

  it { should define_enum_for(:kind).with([:like, :dislike]) }

  it { should validate_presence_of :user }
end
