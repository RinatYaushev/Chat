require 'rails_helper'

RSpec.describe Api::ApidocsController, type: :controller do
  it { should be_a Swagger::Blocks }

  it { should route(:get, 'api/apidocs').to(action: :index) }

  describe 'SWAGGERED_CLASSES' do
    let(:array) do
      [
        described_class,
        Apidocs::Users,
        Apidocs::Profile,
        Apidocs::Avatar,
        Apidocs::Relationships,
        Apidocs::Followers,
        Apidocs::Followees,
        Apidocs::Session,
        Apidocs::Rooms,
        Apidocs::Messages,
        Apidocs::Pings,
        Apidocs::Pictures
      ]
    end

    subject { described_class::SWAGGERED_CLASSES }

    it { should eq array }
  end

  describe '#index.json' do
    let(:data) { double }

    before do
      expect(Swagger::Blocks).to receive(:build_root_json).with(described_class::SWAGGERED_CLASSES).and_return(data)
    end

    before { expect(subject).to receive(:render).with(json: data) }

    it { expect { subject.index }.to_not raise_error }
  end
end
