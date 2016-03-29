require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :user }

  it { should belong_to :product }

  it { should belong_to(:parent).class_name('Comment') }

  it { should have_many(:replies).class_name('Comment').with_foreign_key(:parent_id) }

  it { should validate_presence_of :user }

  it { should validate_presence_of :content }

  context do
    before { expect(subject).to receive(:parent_id?).and_return(false) }

    it { should validate_presence_of :product }
  end

  context do
    before { expect(subject).to receive(:parent_id?).and_return(true) }

    it { should_not validate_presence_of :product }
  end
end
