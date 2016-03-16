require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should have_many(:votes) }

  it { should belong_to(:user).counter_cache(true) }

  it { should validate_presence_of :user }

  it { should validate_presence_of :content }
end
