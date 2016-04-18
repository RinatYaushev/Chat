require 'rails_helper'

RSpec.describe Composite::CompositeTask do
  let(:tasks) { [] }

  its(:tasks) { should eq [] }

  describe '#add_task' do
    let(:task) { double }

    before { subject.add_task task }

    its(:tasks) { should eq [task] }
  end

  describe '#amount' do
    let(:one) { Composite::FirstIngredient.new 1000 }

    let(:two) { Composite::SecondIngredient.new 500 }

    before { expect(subject).to receive(:tasks).and_return([one, two]) }

    its(:amount) { should eq 1500 }
  end
end
