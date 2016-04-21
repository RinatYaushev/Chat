RSpec.describe Publisher do
  let(:user) { stub_model User, name: 'Bob' }

  let(:post) { stub_model Post, content: 'test post' }

  let(:publisher) { Publisher.new(post) }

  subject { publisher }

  describe '.new' do
    its(:post) { should eq post }
  end

  describe '#publish' do
    before { expect(subject).to receive(:user).and_return(user) }

    before { expect(subject).to receive(:puts).with("Publisher: Bob wrote - 'test post'") }

    it { expect { subject.publish }.to_not raise_error }
  end
end
