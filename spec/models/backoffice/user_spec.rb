require 'rails_helper'

RSpec.describe Backoffice::User, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of(:name).case_insensitive }
end
