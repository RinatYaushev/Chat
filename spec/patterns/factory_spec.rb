require 'rails_helper'

RSpec.describe Factory::PeopleFactory do
  describe '#create_man' do
    let(:man) { Factory::Man.new }

    before { expect(Factory::Man).to receive(:new).and_return(man) }

    its(:create_man) { should eq man }
  end

  describe '#create_woman' do
    let(:woman) { Factory::Woman.new }

    before { expect(Factory::Woman).to receive(:new).and_return(woman) }

    its(:create_woman) { should eq woman }
  end
end

RSpec.describe Factory::Office do
  let(:factory) { Factory::PeopleFactory.new }

  subject { Factory::Office.new factory }

  describe '#add_men' do
    let(:man) { Factory::Man.new }

    before { expect(factory).to receive(:create_man).and_return(man) }

    before { subject.add_men 1 }

    its(:members) { should eq [man] }
  end

  describe '#add_women' do
    let(:woman) { Factory::Woman.new }

    before { expect(factory).to receive(:create_woman).and_return(woman) }

    before { subject.add_women 1 }

    its(:members) { should eq [woman] }
  end
end
