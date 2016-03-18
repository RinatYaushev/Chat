require 'rails_helper'

RSpec.describe Api::PicturesController, type: :controller do
  it { should route(:get, '/api/rooms/1/pictures').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/pictures').to(action: :create, room_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:room) { stub_model Room }

    let(:picture) { double }

    let(:params) { { image: 'image', user: subject.current_user } }

    before { expect(Room).to receive(:find).with('26').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, room => Picture).and_return(true) }

    before do
      #
      #subject.collection.new -> picture
      #
      expect(subject).to receive(:collection) do
        double.tap do |a|
          expect(a).to receive(:new).with(params).and_return(picture)
        end
      end
    end

    before { expect(picture).to receive(:save!) }

    before { post :create, room_id: 26, picture: params, format: :json }

    it { should render_template :create }
  end

  describe '#index.json' do
    let(:room) { stub_model Room }

    let(:picture) { double }

    before { expect(Room).to receive(:find).with('27').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, room => Picture).and_return(true) }

    before { get :index, room_id: 27, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@room, :room }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.pictures -> pictures
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:pictures).and_return(:pictures) }
      end
    end

    its(:collection) { should eq :pictures }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@picture, :picture }

    its(:resource) { should eq :picture }
  end
end
