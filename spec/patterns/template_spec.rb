require 'rails_helper'

RSpec.describe Template::Hero do
  describe '#damage_rating' do
    its(:damage_rating) { should eq 10 }
  end

  describe '#occupation_abilities' do
    its(:occupation_abilities) { should eq [] }
  end

  describe '#unique_greeting_line' do
    it { expect { subject.unique_greeting_line }.to raise_error("You must define unique_greeting_line") }
  end
end

RSpec.describe Template::Warrior do
  describe '#damage_rating' do
    its(:damage_rating) { should eq 15 }
  end

  describe '#occupation_abilities' do
    its(:occupation_abilities) { should eq [:strike] }
  end

  describe '#unique_greeting_line' do
    its(:unique_greeting_line) { should eq "Warrior is ready to fight!" }
  end
end

RSpec.describe Template::Mage do
  describe '#damage_rating' do
    its(:damage_rating) { should eq 7 }
  end

  describe '#occupation_abilities' do
    its(:occupation_abilities) { should eq [:magic_spell] }
  end

  describe '#unique_greeting_line' do
    its(:unique_greeting_line) { should eq "Mage is ready to make powerful spells!" }
  end
end
