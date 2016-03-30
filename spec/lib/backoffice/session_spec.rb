require 'rails_helper'

RSpec.describe Backoffice::Session, type: :lib do
  let(:user) { stub_model Backoffice::User }

  subject { Backoffice::Session.new username: 'Test', password: 'password' }

  it { should be_a ActiveModel::Validations }

  its(:username) { should eq 'Test' }

  its(:password) { should eq 'password' }

  context do
    before { expect(Backoffice::User).to receive(:find_by).with(name: 'Test') }

    its(:user) { should be_nil }
  end

  context do
    before { expect(Backoffice::User).to receive(:find_by).with(name: 'Test').and_return(user) }

    its(:user) { should eq user }
  end

  context do
    before { expect(subject).to receive(:user) }

    before { subject.valid? }

    it { expect(subject.errors[:username]).to eq ['not found'] }
  end

  context do
    before { expect(subject).to receive(:user).and_return(user).twice }

    before { expect(user).to receive(:authenticate).with('password').and_return(false) }

    before { subject.valid? }

    it { expect(subject.errors[:password]).to eq ['is invalid'] }
  end

  context do
    before { expect(subject).to receive(:user).and_return(user).twice }

    before { expect(user).to receive(:authenticate).with('password').and_return(true) }

    it { should be_valid }
  end

  describe '#save' do
    context do
      before { expect(subject).to receive(:valid?).and_return(false) }

      its(:save) { should be_nil }
    end

    context do
      before { expect(subject).to receive(:valid?).and_return(true) }

      before { expect(subject).to receive(:user).and_return(user) }

      its(:save) { should eq user }
    end
  end
end
