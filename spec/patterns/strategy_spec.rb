require 'rails_helper'

RSpec.describe Strategy::User do
  let(:printer) { double }

  subject { Strategy::User.new printer }

  its(:printer) { should eq printer }

  its(:posts) { should eq 10 }

  its(:comments) { should eq 5 }

  its(:roles) { should eq [:admin, :moderator] }

  describe '#print_stats' do
    before { expect(printer).to receive(:print).with(10, 5, [:admin, :moderator]) }

    it { expect { subject.print_stats }.to_not raise_error }
  end
end

RSpec.describe Strategy::ActivityStats do
  describe '#print' do
    let(:actvivty_stats) { Strategy::ActivityStats.new }

    subject { actvivty_stats.print 11, 15, [:admin, :moderator] }

    it { should eq "You have 11 posts and 15 comments" }
  end
end

RSpec.describe Strategy::RolesStats do
  describe '#print' do
    let(:actvivty_stats) { Strategy::RolesStats.new }

    subject { actvivty_stats.print 11, 15, [:admin, :moderator] }

    it { should eq "Admin Moderator " }
  end
end
