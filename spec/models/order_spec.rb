require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user).counter_cache(true) }

  it { should have_many(:purchases) }

  it { should validate_presence_of :user }

  context do
    before { expect(subject).to receive(:calculate_total) }

    it { should allow_value(1).for(:total) }
  end

  it { should_not allow_value(0).for(:total) }

  it { is_expected.to callback(:calculate_total).before(:validation).on(:create) }

  describe '#calculate_total' do
    let(:first) { double sum: 10500 }

    let(:second) { double sum: 1559 }

    before { expect(subject).to receive(:purchases).and_return([first, second]) }

    before { subject.send :calculate_total }

    its(:total) { should eq 12059 }
  end
end
