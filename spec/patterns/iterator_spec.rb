require 'rails_helper'

RSpec.describe Iterator::Heroes do
  let(:heroes) { [] }

  its(:heroes) { should eq [] }

  describe '#add_hero' do
    let(:hero) { double }

    before { expect(Iterator::Hero).to receive(:new).with('John').and_return(hero) }

    before { subject.add_hero 'John' }

    its(:heroes) { should eq [hero] }
  end
end
