require 'rails_helper'

describe PurchaseDecorator, type: :decorator do
  describe '#as_json' do
    let(:purchase) { stub_model Purchase, id: 54, user_id: 1, product_id: 2, order_id: 3, quantity: 7 }

    subject { purchase.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 54 }

    its([:user_id]) { should eq 1 }

    its([:product_id]) { should eq 2 }

    its([:order_id]) { should eq 3 }

    its([:quantity]) { should eq 7 }
  end
end
