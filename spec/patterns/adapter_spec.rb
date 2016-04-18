require 'rails_helper'

RSpec.describe Adapter::User do
  let(:taxes) { [] }

  subject { Adapter::User.new taxes }

  its(:taxes) { should eq [] }

  its(:pay) { should eq 0 }

  describe '#add_tax' do
    let(:tax) { double }

    before { subject.add_tax tax }

    its(:taxes) { should eq [tax] }
  end

  describe '#pay_tax' do
    let(:tax) { double }

    let(:taxes) { [tax] }

    before { expect(tax).to receive(:calculate) }

    before { subject.pay_tax tax }

    its(:taxes) { should eq [] }
  end
end

RSpec.describe Adapter::Tax do
  let(:user) { Adapter::User.new }

  subject { Adapter::Tax.new(user, 1000) }

  its(:user) { should eq user }

  its(:total) { should eq 1000 }

  describe '#calculate' do
    before { subject.calculate }

    its('user.pay') { should eq 200 }
  end
end

RSpec.describe Adapter::OldTax do
  its(:total) { should eq 500 }

  its(:rate) { should eq 0.25 }

  describe '#done' do
    before { subject.done }

    its(:done) { should eq 125 }
  end
end

RSpec.describe Adapter::TaxAdapter do
  let(:user) { Adapter::User.new }

  let(:tax) { Adapter::OldTax.new }

  subject { Adapter::TaxAdapter.new(user, tax, 100) }

  its(:user) { should eq user }

  its(:tax) { should eq tax }

  its('tax.total') { should eq 100 }

  describe '#calculate' do
    before { expect(tax).to receive(:done).and_return(125) }

    before { subject.calculate }

    its('user.pay') { should eq 125 }
  end
end
