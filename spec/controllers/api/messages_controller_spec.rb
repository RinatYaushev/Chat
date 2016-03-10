require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do
  it { should route(:get, '/api/rooms/1/messages').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/messages').to(action: :create, room_id: 1) }
end
