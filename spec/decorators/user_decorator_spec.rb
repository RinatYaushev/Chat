require 'rails_helper'

describe UserDecorator do
  describe '#as_json' do
    let(:user) { stub_model User, id: 1, name: 'Test', messages_count: 0, pings_count: 0, pictures_count: 0 }

    subject { user.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'Test' }

    its([:messages_count]) { should eq 0 }

    its([:pings_count]) { should eq 0 }

    its([:pictures_count]) { should eq 0 }

    context do
      before do
        #
        # user.avatar.url(:orginal) -> 'http://test.host/original.jpeg'
        #
        expect(user).to receive(:avatar) do
          double.tap do |a|
            expect(a).to receive(:url).with(:original).and_return('http://test.host/original.jpeg')
          end
        end
      end

      its([:avatar]) { should eq 'http://test.host/original.jpeg' }
    end
  end
end
