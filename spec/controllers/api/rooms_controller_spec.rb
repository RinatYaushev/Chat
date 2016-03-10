require 'rails_helper'

RSpec.describe Api::RoomsController, type: :controller do
  it { should route(:get, '/api/rooms').to(action: :index) }

  it { should route(:post, '/api/rooms').to(action: :create) }

  it { should route(:put, '/api/rooms/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/rooms/1').to(action: :destroy, id: 1) }

  it { should route(:get, '/api/rooms/1').to(action: :show, id: 1) }
end
