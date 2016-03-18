require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should have_many(:votes) }

  it { should belong_to(:user).counter_cache(true) }

  it { should validate_presence_of :user }

  it { should have_attached_file(:image) }

  it { should validate_attachment_presence(:image) }

  it do
    should validate_attachment_content_type(:image).
      allowing('image/png', 'image/jpeg', 'image/jpg').
      rejecting('image/gif', 'application/pdf')
  end

  it { should_not allow_value('image.pdf').for(:image_file_name) }
end
