require 'rails_helper'

RSpec.describe Decorator::SwordDecorator do
  describe '#price' do
    let(:item) { Decorator::Item.new }

    subject { Decorator::SwordDecorator.new item }

    before { expect(item).to receive(:price).and_return(10) }

    its(:price) { should eq 30 }
  end

  describe '#description' do
    let(:item) { Decorator::Item.new }

    subject { Decorator::SwordDecorator.new item }

    before { expect(item).to receive(:description).and_return('Item ') }

    its(:description) { should eq 'Item Sword' }
  end
end

RSpec.describe Decorator::BowDecorator do
  describe '#price' do
    let(:item) { Decorator::Item.new }

    subject { Decorator::BowDecorator.new item }

    before { expect(item).to receive(:price).and_return(10) }

    its(:price) { should eq 20 }
  end

  describe '#description' do
    let(:item) { Decorator::Item.new }

    subject { Decorator::BowDecorator.new item }

    before { expect(item).to receive(:description).and_return('Item ') }

    its(:description) { should eq 'Item Bow' }
  end
end

RSpec.describe Decorator::Item do
  its(:price) { should eq 10 }

  its(:description) { should eq 'Item ' }
end
