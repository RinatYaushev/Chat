require 'rails_helper'

describe PictureDecorator, type: :decorator do
  let(:picture) { stub_model Picture, id: 25 }

  subject { picture.decorate }

  before do
    #
    # picture.image.url(:original) -> 'http://test.host/original.jpeg'
    #
    expect(picture).to receive(:image) do
      double.tap do |a|
        expect(a).to receive(:url).with(:original).and_return('http://test.host/original.jpeg')
      end
    end
  end

  before { expect(subject).to receive(:user).and_return(:user) }

  before { expect(subject).to receive(:room).and_return(:room) }

  its('as_json.symbolize_keys') do
    should eq \
      id: 25,
      image: 'http://test.host/original.jpeg',
      user: :user,
      room: :room
  end
end
