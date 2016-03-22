require 'rails_helper'

describe ProductDecorator, type: :decorator do
  describe '#as_json' do
    let(:product) { stub_model Product, id: 36, name: 'Test', price: 100 }

    subject { product.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 36 }

    its([:name]) { should eq 'Test' }

    its([:price]) { should eq 100 }
  end
end
