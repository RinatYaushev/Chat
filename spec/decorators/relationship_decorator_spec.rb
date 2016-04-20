require 'rails_helper'

describe RelationshipDecorator, type: :decorator do
  describe '#as_json' do
    let(:relationship) { stub_model Relationship, id: 52, follower_id: 52, followee_id: 53 }

    subject { relationship.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 52 }

    its([:follower_id]) { should eq 52 }

    its([:followee_id]) { should eq 53 }
  end
end
