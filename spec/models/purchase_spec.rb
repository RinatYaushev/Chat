require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:user).counter_cache(true) }

  it { should belong_to(:product) }

  it { should belong_to(:order) }

  it { should validate_presence_of :user }

  it { should validate_presence_of :product }

  it { should validate_presence_of :quantity }

  it { should validate_uniqueness_of(:product_id).scoped_to(:user_id, :order_id) }

  describe '.cart' do
    before { expect(Purchase).to receive(:where).with(order_id: nil) }

    it { expect { Purchase.cart }.to_not raise_error }
  end
end
