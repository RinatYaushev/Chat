require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  it { should route(:post, '/api/session').to(action: :create) }

  it { should route(:delete, '/api/session').to(action: :destroy) }
end
