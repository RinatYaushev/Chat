require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:user).counter_cache(true) }

  it { should belong_to(:product) }

  it { should belong_to(:order) }

  it { should validate_presence_of :user }

  it { should validate_presence_of :product }

  it { should validate_presence_of :quantity }

  it { should validate_numericality_of(:quantity).is_greater_than(0) }

  it { is_expected.to callback(:calculate_sum).before(:save) }

  context do
    before { expect(subject).to receive(:calculate_sum).twice }

    it { should validate_uniqueness_of(:product_id).scoped_to(:user_id, :order_id) }
  end

  describe '.cart' do
    before { expect(Purchase).to receive(:where).with(order_id: nil) }

    it { expect { Purchase.cart }.to_not raise_error }
  end

  describe '#calculate_sum' do
    subject { stub_model Purchase, quantity: 10, product: stub_model(Product, price: 15.25) }

    before { subject.send :calculate_sum }

    its(:sum) { should eq 152.5 }
  end
end
