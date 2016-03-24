require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user).counter_cache(true) }

  it { should have_many(:purchases) }
end
