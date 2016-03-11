require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do
  it { should route(:get, '/api/profile').to(action: :show) }

  it { should route(:put, '/api/profile').to(action: :update) }
end
